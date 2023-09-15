# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusAm < Formula
  desc "Circonus Agent Manager"
  homepage "https://circonus.com"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.6/circonus-am_0.2.6_darwin_arm64.tar.gz"
      sha256 "07dd32e20f06e42169bc8e7d11ae30ff9aeb32e475babcffdf9ed2c9d9e5b924"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.6/circonus-am_0.2.6_darwin_amd64.tar.gz"
      sha256 "7011671a9ca420b4a15e7a1064b9ea4436f547646b14fae82ae1d1ef00a6746c"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.6/circonus-am_0.2.6_linux_arm64.tar.gz"
      sha256 "6feac10f69c67170838911a62d5393d157cfa938288c36f5458e00815158a5a7"

      def install
        sbin.install "sbin/circonus-am"
        pkgetc.install "etc/circonus-am.yaml" => "circonus-am.yaml"
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus/agent-manager/releases/download/v0.2.6/circonus-am_0.2.6_linux_amd64.tar.gz"
      sha256 "337b908700f72e5383c2f4791d20ea695972f49bc0f33b04d77c08bd43d864c9"

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
