class Informant < Formula
  desc "Local machines, reporting for CI duty"
  homepage "https://github.com/InformantDev/informant"
  version "0.1.8"
  license "Apache-2.0"

  depends_on "gh"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-arm64"
      sha256 "e17461d215467a52802771d5f3090c8f4f5acfe3ea3760f4958def162f675241"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-x64"
      sha256 "c15c249f50e0164bd16552e009effa688d06a2b86650ba527d100d78d276cca0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-arm64"
      sha256 "76135541b7bfbbfc58ef650cb01a2c44fb6baaa117eefecc60686378ebe5686d"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-x64"
      sha256 "a976cae3f84ffb691469e0141898e8f9751146345ef04cf6ad8c4aa2bd1c9734"
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
