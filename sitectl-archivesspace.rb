# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlArchivesspace < Formula
  desc "A sitectl plugin for ArchivesSpace stacks"
  homepage "https://github.com/libops/sitectl-archivesspace"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-archivesspace/releases/download/v1.0.0/sitectl-archivesspace_Darwin_x86_64.tar.gz"
      sha256 "d0787f82a05715e10b4b6d4be6dd52883e3a021b1aea68ea1900921baefbe0d3"

      define_method(:install) do
        bin.install "sitectl-archivesspace"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-archivesspace/releases/download/v1.0.0/sitectl-archivesspace_Darwin_arm64.tar.gz"
      sha256 "cbeed4630f399a48900d95adb23de10c25d00c58f1f18f4a9532e7c933b81285"

      define_method(:install) do
        bin.install "sitectl-archivesspace"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-archivesspace/releases/download/v1.0.0/sitectl-archivesspace_Linux_x86_64.tar.gz"
      sha256 "d41dcaa49466da814e6a9ad57a7fbb23683be1b56f128a9fd8edfc9c954088ef"

      define_method(:install) do
        bin.install "sitectl-archivesspace"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-archivesspace/releases/download/v1.0.0/sitectl-archivesspace_Linux_arm64.tar.gz"
      sha256 "f349ec410db67fca6dde95df386cb1bb7c942a34b4fb05672a95629963a3092a"

      define_method(:install) do
        bin.install "sitectl-archivesspace"
      end
    end
  end
end
