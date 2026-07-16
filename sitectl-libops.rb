# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlLibops < Formula
  desc "A sitectl plugin for LibOps platform operations"
  homepage "https://github.com/libops/sitectl-libops"
  version "1.3.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.3.0/sitectl-libops_Darwin_x86_64.tar.gz"
      sha256 "335ac853dae3716a2df3d52e3fabf354ece09a7baeda5751c5eaa2603f074023"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.3.0/sitectl-libops_Darwin_arm64.tar.gz"
      sha256 "53fe1f89ce64d7af13946a6ac7b8ed13cefe7f5889195ce0e51b1e5d52a92c03"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.3.0/sitectl-libops_Linux_x86_64.tar.gz"
      sha256 "36c741723bd70fb57bca9e08f2d1f61cc2522be973c2ee8215a3082ed7cfa5b5"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.3.0/sitectl-libops_Linux_arm64.tar.gz"
      sha256 "04ad50a22832b3d7690e9c6111f8dc9ecdf915c61080947fc71e4b8e57bc839c"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
  end
end
