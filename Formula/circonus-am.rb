# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusAm < Formula
  desc "Circonus Agent Manager"
  homepage "https://circonus.com"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.2/circonus-am_0.3.2_darwin_arm64.tar.gz"
      sha256 "66ac63b3724c87c44e5f172d3f741f11564e158cea8f4e2dd77dcb61d2c78aba"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.2/circonus-am_0.3.2_darwin_amd64.tar.gz"
      sha256 "078741b990aa1ad9fc71e6cc9e969ecd66ac230765249214193796aafbb29d0f"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.2/circonus-am_0.3.2_linux_arm64.tar.gz"
      sha256 "fe9199d82624b3720c6d610aa89691100a289e7b54d2e8ddfa38915f165f270e"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.2/circonus-am_0.3.2_linux_amd64.tar.gz"
      sha256 "b3c33ea4dbd9554fdda66f0c751e5654a5db529136965984dc0a771b66856c4b"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
  end

  def caveats
    <<~EOS
      Install:
      1. Run #{sbin}/circonus-am --register="registration token"
      2. Run "brew services start circonus-am"

      Upgrade:
      1. Run "brew services restart circonus-am"
    EOS
  end

  service do
    run [opt_sbin/"circonus-am", "--config", etc/"circonus-am/circonus-am.yaml"]
    keep_alive true
    log_path var/"log/circonus-agent-manager.log"
    error_log_path var/"log/circonus-agent-manager.log"
  end

  test do
    system "#{sbin}/circonus-am --version"
  end
end
