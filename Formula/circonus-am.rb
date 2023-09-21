# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusAm < Formula
  desc "Circonus Agent Manager"
  homepage "https://circonus.com"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.8/circonus-am_0.2.8_darwin_arm64.tar.gz"
      sha256 "25b842d05661574be429ab8e6b917a5be5dfd64c5de7177d90b5b5454828e206"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.8/circonus-am_0.2.8_darwin_amd64.tar.gz"
      sha256 "0c32223fd3fc177fd27dfbc2433726281762e2c7bb0dcf37b6b15343532c73a7"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.8/circonus-am_0.2.8_linux_arm64.tar.gz"
      sha256 "03c4c8b7834441797ef84b68638092828bf527ec8eb984cc756095092f79e5b1"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.8/circonus-am_0.2.8_linux_amd64.tar.gz"
      sha256 "71e0e619a3448bcd3b88d0a0c1677cf8451abc7602b3ab1699144b951879f67a"

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
