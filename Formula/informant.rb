class Informant < Formula
  desc "Local machines, reporting for CI duty"
  homepage "https://github.com/InformantDev/informant"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-arm64"
      sha256 "d4178c9e749292ef8c2c68406a0c83d9fec38c7e2703e0012156b310fce0522e"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-x64"
      sha256 "0d5fa34cde3c82adbf3df8e91bee72e28ce4a19d04cbcbd6bb4b7af40da1bd87"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-arm64"
      sha256 "18807b3cb9966f14b0b3a637fc4e643fcc3a2ee62ed3f55c3d082e76010c0b23"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-x64"
      sha256 "45a663c4c8c3cb53ebcaf506c7046193829a28b4fe7e8f11374085b379ec26d7"
    end
  end

  def install
    binary_name = "informant-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "x64"}"
    bin.install binary_name => "informant"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/informant --version")
  end
end
