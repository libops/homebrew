# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class Sitectl < Formula
  desc "CLI for managing local and remote Docker Compose projects"
  homepage "https://github.com/libops/sitectl"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl/releases/download/v1.0.2/sitectl_Darwin_x86_64.tar.gz"
      sha256 "98ae56ec85313529ca97253c33853a22a978afdb67afc605a60fcdbd6d40b2e8"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl/releases/download/v1.0.2/sitectl_Darwin_arm64.tar.gz"
      sha256 "d6c4e7ce683135a5d515807fdd0897491e15afc3811bc9e8b83f1b96f4563e60"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl/releases/download/v1.0.2/sitectl_Linux_x86_64.tar.gz"
      sha256 "cbc7c26c45f9bcc9905b5dae9656622dbb3583819191bdfc4b6df7c63b9f693b"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl/releases/download/v1.0.2/sitectl_Linux_arm64.tar.gz"
      sha256 "56d320711b1c51c9c6220fd21235b251cbfaba6bb3736c010c06e84539ffa092"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
  end
end
