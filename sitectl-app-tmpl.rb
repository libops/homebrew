# typed: false
# frozen_string_literal: true

# This file was generated from verified GitHub release assets. DO NOT EDIT.
class SitectlAppTmpl < Formula
  desc "A sitectl plugin template for application Compose stacks"
  homepage "https://github.com/libops/sitectl-app-tmpl"
  version "1.0.0"
  license "MIT"

  depends_on "libops/homebrew/sitectl"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.0.0/sitectl-app-tmpl_Darwin_x86_64.tar.gz"
      sha256 "b3a819214c2040e015e76a011521841a50a7bb6b090d1839d91b3468ba276296"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.0.0/sitectl-app-tmpl_Darwin_arm64.tar.gz"
      sha256 "52392ca15fdd907e87106163c5929fc3ddb31362cad7fbfed527f53484298219"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.0.0/sitectl-app-tmpl_Linux_x86_64.tar.gz"
      sha256 "5d3108e23b02e48da5d56f1ff76829b96beed478a94667e48c07d4a654d7533f"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/libops/sitectl-app-tmpl/releases/download/v1.0.0/sitectl-app-tmpl_Linux_arm64.tar.gz"
      sha256 "b217c4cede4311406703254f8f4ea4a0ee6a3903a71a7163d5c2da5c7e6989eb"

      define_method(:install) do
        bin.install "sitectl-app-tmpl"
      end
    end
  end
end
