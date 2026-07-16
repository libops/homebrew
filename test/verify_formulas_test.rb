# frozen_string_literal: true

require "minitest/autorun"
require "tempfile"
require_relative "../scripts/verify-formulas"

class VerifyFormulasTest < Minitest::Test
  def formula(description: "WordPress stacks", homepage: "https://github.com/libops/sitectl-wp",
              version: "0.6.0", lifecycle: "", between: "", package: "sitectl-wp")
    <<~RUBY
      class SitectlWp < Formula
        desc "#{description}"
        homepage "#{homepage}"
        license "MIT"
        version "#{version}"
        #{lifecycle}
        url "https://github.com/libops/#{package}/releases/download/v#{version}/#{package}_Linux_x86_64.tar.gz"
        #{between}sha256 "#{"a" * 64}"
      end
    RUBY
  end

  def with_formula(content)
    Tempfile.create(["formula", ".rb"]) do |file|
      file.write(content)
      file.flush
      yield file.path
    end
  end

  def test_valid_formula_passes_exact_asset_to_downloader
    seen = []
    with_formula(formula) do |path|
      FormulaVerification.verify(path, downloader: ->(asset) { seen << asset })
    end

    assert_equal 1, seen.length
    assert_equal "a" * 64, seen.first.sha256
    assert_equal "https://github.com/libops/sitectl-wp/releases/download/v0.6.0/sitectl-wp_Linux_x86_64.tar.gz",
                 seen.first.url
  end

  def test_rejects_empty_description
    with_formula(formula(description: "")) do |path|
      error = assert_raises(FormulaVerification::VerificationError) { FormulaVerification.parse(path) }
      assert_includes error.message, "desc must be present and non-empty"
    end
  end

  def test_rejects_cross_repository_asset
    with_formula(formula(homepage: "https://github.com/libops/sitectl-drupal")) do |path|
      error = assert_raises(FormulaVerification::VerificationError) { FormulaVerification.parse(path) }
      assert_includes error.message, "outside the exact package/version boundary"
    end
  end

  def test_rejects_non_adjacent_checksum
    with_formula(formula(between: "depends_on \"curl\"\n  ")) do |path|
      error = assert_raises(FormulaVerification::VerificationError) { FormulaVerification.parse(path) }
      assert_includes error.message, "sha256 must immediately follow its URL"
    end
  end

  def test_rejects_invalid_ruby
    with_formula("class Broken < Formula\n") do |path|
      error = assert_raises(FormulaVerification::VerificationError) { FormulaVerification.parse(path) }
      assert_includes error.message, "invalid Ruby syntax"
    end
  end

  def test_rejects_enabled_pre_v1_isle
    content = formula(
      description: "Islandora stacks",
      homepage: "https://github.com/libops/sitectl-isle",
      version: "0.19.0",
      package: "sitectl-isle"
    )
    with_formula(content) do |path|
      error = assert_raises(FormulaVerification::VerificationError) { FormulaVerification.parse(path) }
      assert_includes error.message, "pre-v1 sitectl-isle must remain disabled"
    end
  end

  def test_accepts_disabled_pre_v1_isle
    content = formula(
      description: "Islandora stacks",
      homepage: "https://github.com/libops/sitectl-isle",
      version: "0.19.0",
      package: "sitectl-isle",
      lifecycle: <<~RUBY
        disable! date: "2026-07-16", because: "requires sitectl 0.40.0 and sitectl-drupal 0.12.0"
      RUBY
    )
    with_formula(content) do |path|
      assert_equal 1, FormulaVerification.parse(path).length
    end
  end
end
