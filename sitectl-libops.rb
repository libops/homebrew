# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlLibops < Formula
  desc "A sitectl plugin for LibOps platform operations"
  homepage "https://github.com/libops/sitectl-libops"
  version "1.4.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.4.0/sitectl-libops_Darwin_x86_64.tar.gz"
      sha256 "3d3850639f83d70df9fe477f38e2464f3061153bfdf10563d0c302c212b5d66a"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.4.0/sitectl-libops_Darwin_arm64.tar.gz"
      sha256 "c62ec0f2b19f4d6de080f84277127e90396558a15bc200934150b906adcf08cb"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.4.0/sitectl-libops_Linux_x86_64.tar.gz"
      sha256 "6443c1c3d9835771fea9c742426ae425ee3125b14c7cfcaf1ee729942bbe6a70"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-libops/releases/download/v1.4.0/sitectl-libops_Linux_arm64.tar.gz"
      sha256 "a722eed76467ec7cfe4a5a08474e02d00de6139adb3d758c3b670b85c59afa44"

      define_method(:install) do
        bin.install "sitectl-libops"
      end
    end
  end
end
