# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class Sitectl < Formula
  desc "CLI for managing local and remote Docker Compose projects"
  homepage "https://github.com/libops/sitectl"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl/releases/download/v1.0.0/sitectl_Darwin_x86_64.tar.gz"
      sha256 "0ca71d0761821ae29d671bb215ba63b80ff13dc3f1a891d89f75e500219115cc"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl/releases/download/v1.0.0/sitectl_Darwin_arm64.tar.gz"
      sha256 "23c8dca0be176d8e520fe27b3175e6d3bcefcb6221ea1aca3fb273270a0a8eaa"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl/releases/download/v1.0.0/sitectl_Linux_x86_64.tar.gz"
      sha256 "27c67fc818c2e133dd62c83f6e17b3cb212b32b393d84c600955552ee8f4fa35"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl/releases/download/v1.0.0/sitectl_Linux_arm64.tar.gz"
      sha256 "bf542faf013dd2782ceb278b020314e0b59a8bcc1cff83bb32e90ce2d1773ebc"

      define_method(:install) do
        bin.install "sitectl"
      end
    end
  end
end
