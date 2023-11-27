# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusAm < Formula
  desc "Circonus Agent Manager"
  homepage "https://circonus.com"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.9/circonus-am_0.3.9_darwin_arm64.tar.gz"
      sha256 "e191de8712a3761c758d078d6a8a2686eec82c5cadbe0f220039f703146db2f8"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.9/circonus-am_0.3.9_darwin_amd64.tar.gz"
      sha256 "c0a26fea9ca24fd6aa0048cd8c4b8c75dd388c6c9223e6881e8e32f6b592a910"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.9/circonus-am_0.3.9_linux_arm64.tar.gz"
      sha256 "1880ddd1a8f375b6351cfcb3724bc2737f476d5a135f7f73a187f741170b84b8"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.3.9/circonus-am_0.3.9_linux_amd64.tar.gz"
      sha256 "46d29200a6cdc8cc0d84bb6e1f0310ac3472bc93aa2633e7b6021e1996ab0bd1"

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
