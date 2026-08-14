class Informant < Formula
  desc "Local machines, reporting for CI duty"
  homepage "https://github.com/InformantDev/informant"
  version "0.1.4"
  license "Apache-2.0"

  depends_on "gh"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-arm64"
      sha256 "76e01731788556073fdc205bd1d1e6da52fde463e976a4b38b03e8cecf665ebf"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-x64"
      sha256 "7151f1a50b1cfbfcad490942701fa5668ffefe21b1c52a3ef86edf352ac384d7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-arm64"
      sha256 "63ee464cdea09357ea07632e436d53bf1c122d907051a9263d3dac82ed9507eb"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-x64"
      sha256 "ce092f62064f55fb1410ad6b568d780984295edda653175b955d93accd037402"
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
