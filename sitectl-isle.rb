# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlIsle < Formula
  desc "Sitectl plugin for Islandora stacks"
  homepage "https://github.com/libops/sitectl-isle"
  version "1.0.1"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  depends_on "libops/homebrew/sitectl-drupal"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.1/sitectl-isle_Darwin_x86_64.tar.gz"
      sha256 "34e91c770f507f1f2e9c1986d1d241bc123eef66654152b46e087da84dc629a6"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.1/sitectl-isle_Darwin_arm64.tar.gz"
      sha256 "0ad543180d04c4e6380aa18831f3b6a2a8558a69d3925aa5286bdcff8607ca3d"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.1/sitectl-isle_Linux_x86_64.tar.gz"
      sha256 "7fc75ac0393b7840600cf33b5aee437783427a9f492a435efd99d954b8764d56"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-isle/releases/download/v1.0.1/sitectl-isle_Linux_arm64.tar.gz"
      sha256 "6162f0a2a18524e174145f46e14bf0af98d72111ff4fd65ee5421584759a4675"

      define_method(:install) do
        bin.install "sitectl-isle"
      end
    end
  end
end
