# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlDrupal < Formula
  desc "A sitectl plugin for Drupal websites"
  homepage "https://github.com/libops/sitectl-drupal"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-drupal/releases/download/v1.0.0/sitectl-drupal_Darwin_x86_64.tar.gz"
      sha256 "2c808389e46d6ca25ef2be2d5890a5d03020c271b3369270d68159b0fbbe1f74"

      define_method(:install) do
        bin.install "sitectl-drupal"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-drupal/releases/download/v1.0.0/sitectl-drupal_Darwin_arm64.tar.gz"
      sha256 "41af997abea43c88a8d877ff694e0f0f4e0850639f970f89377db5b1448a1478"

      define_method(:install) do
        bin.install "sitectl-drupal"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-drupal/releases/download/v1.0.0/sitectl-drupal_Linux_x86_64.tar.gz"
      sha256 "4d8bce4ed3f6fd74fd69f9d4182791ebf874ed4265362dcd9c80cb83136e1147"

      define_method(:install) do
        bin.install "sitectl-drupal"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-drupal/releases/download/v1.0.0/sitectl-drupal_Linux_arm64.tar.gz"
      sha256 "ff003160f7e199de961622bb1675fa9ab83893944d41cd2933fc3aafdfb4a9cb"

      define_method(:install) do
        bin.install "sitectl-drupal"
      end
    end
  end
end
