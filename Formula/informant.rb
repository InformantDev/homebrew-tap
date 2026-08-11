class Informant < Formula
  desc "Local machines, reporting for CI duty"
  homepage "https://github.com/InformantDev/informant"
  version "0.1.2"
  license "Apache-2.0"

  depends_on "gh"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-arm64"
      sha256 "ebde7ce382d4593519d9d8fdc3f83ed5f240970ddafb9eb8187146c104767571"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-darwin-x64"
      sha256 "a1cff19cd790221f2962696cc0c1cf97a5e513647c7235cb9bcbe28a0d42bb01"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-arm64"
      sha256 "6f9fa89bd6d64e0d46815efc81b28c2a9026f5cb7be79fce467bdd360161295b"
    else
      url "https://github.com/InformantDev/informant/releases/download/v#{version}/informant-linux-x64"
      sha256 "4630f05e1685c19104ebbb50cbde6b27db12807008a4526ecaff9bc8171c0d78"
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
