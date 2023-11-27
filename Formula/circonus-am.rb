# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusAm < Formula
  desc "Circonus Agent Manager"
  homepage "https://circonus.com"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.8/circonus-am_0.3.8_darwin_arm64.tar.gz"
      sha256 "1a3096a82aa524b04fb78e21336aaed66004177c515df9fdf8e6518ec117e48b"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.8/circonus-am_0.3.8_darwin_amd64.tar.gz"
      sha256 "b25962c7c1077a2dc5719eaa3c0f2838f14cba97946298db9efbc7a1742a254e"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.8/circonus-am_0.3.8_linux_arm64.tar.gz"
      sha256 "93949db9ac1683bb868e8576e4b787f5ca6a89cc2e9adbb170d4e74bad311e61"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.8/circonus-am_0.3.8_linux_amd64.tar.gz"
      sha256 "77417b3b054bc74a25a2f9a8f97c2bd93b3f65a5f1fe2e27fa7e4f26eca1a8f1"

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
      1. Run #{sbin}/circonus-am --config="#{etc}/circonus-am/circonus-am.yaml" --register="registration token"
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
