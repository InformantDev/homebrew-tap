class Informant < Formula
  desc "Local machines, reporting for CI duty"
  homepage "https://github.com/InformantDev/informant"
  version "0.1.6"
  license "Apache-2.0"

  depends_on "gh"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-arm64"
      sha256 "0ed6d530effbace79d79a9a81706fc1db87cf0b85dc8132d04b64cc583726654"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-x64"
      sha256 "6765a14231bb891ca8665149d5a928a9ef014cb3a0a00bb4fe282e68323c0c31"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-arm64"
      sha256 "a86b74115a4a4cca9dc7802c682048ab16e682face75ff4aa100a763d8b15e27"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-x64"
      sha256 "ec5d4746f5a4bc9b740be632cf9b06b26bcbdfba3202105e8069011ef90d8b59"
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
