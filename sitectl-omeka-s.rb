# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlOmekaS < Formula
  desc "A sitectl plugin for Omeka S stacks"
  homepage "https://github.com/libops/sitectl-omeka-s"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-omeka-s/releases/download/v1.0.0/sitectl-omeka-s_Darwin_x86_64.tar.gz"
      sha256 "5f7c8c695e9c028af8b1c414aca26560dee7db67bb8a8d5ca1b699b8c9cf6a68"

      define_method(:install) do
        bin.install "sitectl-omeka-s"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-omeka-s/releases/download/v1.0.0/sitectl-omeka-s_Darwin_arm64.tar.gz"
      sha256 "56f30f9d7befc3ee955d5ee7ffc3bdcf3344f320d1f926985ae00d3a1539ce16"

      define_method(:install) do
        bin.install "sitectl-omeka-s"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-omeka-s/releases/download/v1.0.0/sitectl-omeka-s_Linux_x86_64.tar.gz"
      sha256 "74c97c77c198cc86cc57b8dc6a1a0ad22ec959599ffabb7493a1ad4bb3839f79"

      define_method(:install) do
        bin.install "sitectl-omeka-s"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-omeka-s/releases/download/v1.0.0/sitectl-omeka-s_Linux_arm64.tar.gz"
      sha256 "7280ac6fb06b125aacfe265be015a82610172a5a76f3e3feefeb95099b9ee37b"

      define_method(:install) do
        bin.install "sitectl-omeka-s"
      end
    end
  end
end
