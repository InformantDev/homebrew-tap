# Informant — Homebrew tap

Homebrew formula for [**Informant**](https://github.com/InformantDev/informant),
local machines reporting for CI duty.

## Install

```bash
brew install informantdev/tap/informant
gh auth login
informant setup
informant --version
```

(`informantdev/tap` resolves to this repo, `github.com/InformantDev/homebrew-tap`.)
The formula supports macOS and Linux on Apple silicon/ARM64 and x86-64, and installs GitHub CLI as
a dependency. Linux container jobs use distro-native rootless Podman, which `informant setup` can
install on Debian/Ubuntu and Fedora/RHEL hosts.

## Cutting a release (maintainers)

The formula installs prebuilt, self-contained binaries from GitHub Releases in the main repository.
The main repository's Informant `release` job publishes a generated `informant.rb` containing the
release version and all four checksums, then opens the formula update pull request in this repository.
