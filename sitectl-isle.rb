# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlIsle < Formula
  desc "Sitectl plugin for Islandora stacks"
  homepage "https://github.com/libops/sitectl-isle"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  depends_on "libops/homebrew/sitectl-drupal"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.0/sitectl-isle_Darwin_x86_64.tar.gz"
      sha256 "f2574a934ee6412ab02ab9e751b5ffeb7938d7405de72fc4ac2548f641cc8eeb"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.0/sitectl-isle_Darwin_arm64.tar.gz"
      sha256 "3d70b0360216487b04b44f9111410c36670c82805a4320a5d1e21f2158a8d4d0"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.0/sitectl-isle_Linux_x86_64.tar.gz"
      sha256 "3d7eaf198afd20699d4df9ce975c19420e839f8ced6f8cc999d814f655e8914e"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.0/sitectl-isle_Linux_arm64.tar.gz"
      sha256 "cf7496cbb9bf1612e5a4f982f1554f72167ffc1d7504e9a704ec4514b6fcf9b3"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
  end
end
