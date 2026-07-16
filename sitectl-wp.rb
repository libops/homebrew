# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlWp < Formula
  desc "A sitectl plugin for WordPress stacks"
  homepage "https://github.com/libops/sitectl-wp"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-wp/releases/download/v1.0.0/sitectl-wp_Darwin_x86_64.tar.gz"
      sha256 "99c5ef03436e14c4d3f97cf0ac02f5c9f45a7370a8f82559688604a338d98db1"

      define_method(:install) do
        bin.install "sitectl-wp"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-wp/releases/download/v1.0.0/sitectl-wp_Darwin_arm64.tar.gz"
      sha256 "d14540e4951320731ed485ae2b4f3b121fa7229b74e0b3c47c0f6b2df0c2d536"

      define_method(:install) do
        bin.install "sitectl-wp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-wp/releases/download/v1.0.0/sitectl-wp_Linux_x86_64.tar.gz"
      sha256 "8f5117f1a67a72781b9d7abfd9a7712e65d0471f4207d0f5d353c3fabbf735cf"

      define_method(:install) do
        bin.install "sitectl-wp"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-wp/releases/download/v1.0.0/sitectl-wp_Linux_arm64.tar.gz"
      sha256 "fc98af7f8440ff743104c794791cca8cbd08254aa7289ea958f9af547504494a"

      define_method(:install) do
        bin.install "sitectl-wp"
      end
    end
  end
end
