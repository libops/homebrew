#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "open3"
require "tempfile"
require "uri"

module FormulaVerification
  FormulaAsset = Struct.new(:url, :sha256, keyword_init: true)

  class VerificationError < StandardError; end

  module_function

  def parse(path)
    content = File.read(path)
    RubyVM::InstructionSequence.compile(content, path)

    description = content[/^\s*desc\s+"([^"]*)"\s*$/, 1]
    raise VerificationError, "#{path}: desc must be present and non-empty" if description.nil? || description.empty?

    license = content[/^\s*license\s+"([^"]+)"\s*$/, 1]
    raise VerificationError, "#{path}: license must be MIT" unless license == "MIT"

    homepage = content[/^\s*homepage\s+"([^"]+)"\s*$/, 1]
    version = content[/^\s*version\s+"([^"]+)"\s*$/, 1]
    raise VerificationError, "#{path}: homepage is required" if homepage.nil?
    raise VerificationError, "#{path}: version is required" if version.nil?

    package = package_from_homepage(homepage, path)
    validate_lifecycle(content, package, version, path)
    assets = parse_assets(content, path)
    assets.each { |asset| validate_url(asset.url, package, version, path) }
    assets
  rescue SyntaxError => e
    raise VerificationError, "#{path}: invalid Ruby syntax: #{e.message.lines.first.strip}"
  end

  def package_from_homepage(homepage, path)
    uri = URI.parse(homepage)
    match = uri.path.match(%r{\A/libops/([A-Za-z0-9._-]+)\z})
    unless uri.scheme == "https" && uri.host == "github.com" && uri.userinfo.nil? &&
        uri.query.nil? && uri.fragment.nil? && match
      raise VerificationError, "#{path}: homepage must be an exact https://github.com/libops/<package> URL"
    end
    match[1]
  rescue URI::InvalidURIError
    raise VerificationError, "#{path}: homepage is not a valid URL"
  end

  def validate_lifecycle(content, package, version, path)
    return unless package == "sitectl-isle"

    match = version.match(/\A(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\z/)
    raise VerificationError, "#{path}: sitectl-isle version must be exact SemVer" unless match
    return unless match[1].to_i < 1

    disable = content.match(
      /^\s*disable!\s+date:\s*"([^"]+)",\s+because:\s*"([^"]+)"\s*$/
    )
    disabled = disable &&
               disable[1].match?(/\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/) &&
               disable[2] == "requires sitectl 0.40.0 and sitectl-drupal 0.12.0"
    return if disabled

    raise VerificationError,
          "#{path}: pre-v1 sitectl-isle must remain disabled until its v1 RPC-compatible release"
  end

  def parse_assets(content, path)
    assets = []
    pending_url = nil

    content.each_line.with_index(1) do |line, line_number|
      if (match = line.match(/^\s*url\s+"([^"]+)"\s*$/))
        if pending_url
          raise VerificationError, "#{path}:#{line_number}: URL is missing its adjacent sha256"
        end
        pending_url = match[1]
      elsif (match = line.match(/^\s*sha256\s+"([0-9a-f]{64})"\s*$/))
        unless pending_url
          raise VerificationError, "#{path}:#{line_number}: sha256 is missing its adjacent URL"
        end
        assets << FormulaAsset.new(url: pending_url, sha256: match[1])
        pending_url = nil
      elsif pending_url && !line.strip.empty? && !line.lstrip.start_with?("#")
        raise VerificationError, "#{path}:#{line_number}: sha256 must immediately follow its URL"
      end
    end

    raise VerificationError, "#{path}: final URL is missing its adjacent sha256" if pending_url
    raise VerificationError, "#{path}: at least one release asset is required" if assets.empty?

    assets
  end

  def validate_url(url, package, version, path)
    uri = URI.parse(url)
    expected_prefix = "/libops/#{package}/releases/download/v#{version}/"
    unless uri.scheme == "https" && uri.host == "github.com" && uri.userinfo.nil? &&
        uri.port == 443 && uri.path.start_with?(expected_prefix) &&
        uri.path.length > expected_prefix.length && uri.query.nil? && uri.fragment.nil?
      raise VerificationError, "#{path}: release URL is outside the exact package/version boundary: #{url}"
    end
  rescue URI::InvalidURIError
    raise VerificationError, "#{path}: invalid release URL: #{url}"
  end

  def download_and_verify(asset)
    Tempfile.create("homebrew-formula-asset") do |file|
      command = [
        "curl", "--silent", "--show-error", "--fail", "--location",
        "--retry", "3", "--retry-all-errors", "--connect-timeout", "15",
        "--max-time", "300", "--max-filesize", "268435456", "--proto", "=https",
        "--output", file.path, asset.url
      ]
      _stdout, stderr, status = Open3.capture3(*command)
      unless status.success?
        raise VerificationError, "download failed for #{asset.url}: #{stderr.strip}"
      end

      actual = Digest::SHA256.file(file.path).hexdigest
      unless actual == asset.sha256
        raise VerificationError, "sha256 mismatch for #{asset.url}: expected #{asset.sha256}, got #{actual}"
      end
    end
  end

  def verify(path, downloader: method(:download_and_verify))
    assets = parse(path)
    assets.each { |asset| downloader.call(asset) }
    puts "Verified #{path}: #{assets.length} release asset(s)"
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.empty?
    warn "usage: #{$PROGRAM_NAME} FORMULA.rb [...]"
    exit 2
  end

  failures = []
  ARGV.each do |path|
    FormulaVerification.verify(path)
  rescue FormulaVerification::VerificationError, Errno::ENOENT => e
    failures << e.message
  end

  unless failures.empty?
    failures.each { |failure| warn failure }
    exit 1
  end
end
