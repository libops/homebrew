# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlOmekaClassic < Formula
  desc "A sitectl plugin for Omeka Classic stacks"
  homepage "https://github.com/libops/sitectl-omeka-classic"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-omeka-classic/releases/download/v1.0.0/sitectl-omeka-classic_Darwin_x86_64.tar.gz"
      sha256 "cd1a3a7a0cfc3a1f567ead4e682390b065ce94d936a034c2845c3c8485cee300"

      define_method(:install) do
        bin.install "sitectl-omeka-classic"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-omeka-classic/releases/download/v1.0.0/sitectl-omeka-classic_Darwin_arm64.tar.gz"
      sha256 "c04cd716d58483dd51b054b7986664cf3bf23c320d30bfb938bd567b1867e610"

      define_method(:install) do
        bin.install "sitectl-omeka-classic"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-omeka-classic/releases/download/v1.0.0/sitectl-omeka-classic_Linux_x86_64.tar.gz"
      sha256 "38043ed4656c1a6a5a6446806ff3f61547c581d1b0045a1a561af7679ab7e68c"

      define_method(:install) do
        bin.install "sitectl-omeka-classic"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-omeka-classic/releases/download/v1.0.0/sitectl-omeka-classic_Linux_arm64.tar.gz"
      sha256 "85093c365be46bf14981f286f826b313eda4f423b6de2c7d2074ccc1b7df6764"

      define_method(:install) do
        bin.install "sitectl-omeka-classic"
      end
    end
  end
end
