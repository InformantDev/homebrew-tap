class Informant < Formula
  desc "Local machines, reporting for CI duty"
  homepage "https://github.com/InformantDev/informant"
  version "0.1.5"
  license "Apache-2.0"

  depends_on "gh"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-arm64"
      sha256 "1122f961ed6623fcd2f4edbcf1ce08e292727af4e1e9827bdc7f53a62dbeda61"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-x64"
      sha256 "6b7cdefc7168ea2e900305d5c9846485975195803d7a4cbfb0c8a8b728cae8d8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-arm64"
      sha256 "a61dcb3d7d912489d5d33f80845755f56917b355bf0095b3ba70decf967e56b7"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-x64"
      sha256 "328181fd7016c42192c9b1e8e0ab1980a660b996e7427533469fc9265cae72d4"
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
