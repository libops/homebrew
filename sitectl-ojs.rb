# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlOjs < Formula
  desc "A sitectl plugin for Open Journal Systems stacks"
  homepage "https://github.com/libops/sitectl-ojs"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-ojs/releases/download/v1.0.0/sitectl-ojs_Darwin_x86_64.tar.gz"
      sha256 "827799cd099cebc522203f8a92219674fd4e1b286bfafe122bf6eab5621d0eee"

      define_method(:install) do
        bin.install "sitectl-ojs"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-ojs/releases/download/v1.0.0/sitectl-ojs_Darwin_arm64.tar.gz"
      sha256 "b0e10d100252c25ca621c04365c7f6a7f5af7e829b132dd3ee93a5aaee7a641a"

      define_method(:install) do
        bin.install "sitectl-ojs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-ojs/releases/download/v1.0.0/sitectl-ojs_Linux_x86_64.tar.gz"
      sha256 "751721824e8d51f802d564d092ac42908b0efd0b1f7ae410193bc186788c33f1"

      define_method(:install) do
        bin.install "sitectl-ojs"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-ojs/releases/download/v1.0.0/sitectl-ojs_Linux_arm64.tar.gz"
      sha256 "40a0d9984c7bc44c301dfe8e29c15219482a0edafeb9630e3882cddd45dcf90a"

      define_method(:install) do
        bin.install "sitectl-ojs"
      end
    end
  end
end
