# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlAppTmpl < Formula
  desc "A sitectl plugin template for application Compose stacks"
  homepage "https://github.com/libops/sitectl-app-tmpl"
  version "1.2.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.2.0/sitectl-app-tmpl_Darwin_x86_64.tar.gz"
      sha256 "c477ff56cc8b0818359fdeb12ccb5514c6a3f53264f8ac781b1f64c29fefda2b"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.2.0/sitectl-app-tmpl_Darwin_arm64.tar.gz"
      sha256 "c02b52f95d7cb4643fa7582ff49422bbfa918cd6f49625e3ae51e04d4989aaf4"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.2.0/sitectl-app-tmpl_Linux_x86_64.tar.gz"
      sha256 "ecf04971733ad55c5c6a18931406173f8d493708adff000ad6a18a36ce0888c3"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.2.0/sitectl-app-tmpl_Linux_arm64.tar.gz"
      sha256 "16a433ca024b98a4f0970a503ed5b8b758d818a1068eea482e724fc4d4d9cebd"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
  end
end
