# Informant — Homebrew tap

Homebrew formula for [**Informant**](https://github.com/InformantDev/informant),
local machines reporting for CI duty.

## Install

```bash
brew install informantdev/tap/informant
informant --version
```

(`informantdev/tap` resolves to this repo, `github.com/InformantDev/homebrew-tap`.)

## Cutting a release (maintainers)

The formula installs a prebuilt, self-contained binary from a GitHub Release on
the main repo. To ship a new version:

1. **Build** all four binaries from the main repo:
   ```bash
   bun install --frozen-lockfile
   bun build apps/informant/src/cli.ts --compile --minify --target=bun-darwin-arm64 --outfile=apps/informant/dist/informant-darwin-arm64
   bun build apps/informant/src/cli.ts --compile --minify --target=bun-darwin-x64 --outfile=apps/informant/dist/informant-darwin-x64
   bun build apps/informant/src/cli.ts --compile --minify --target=bun-linux-x64 --outfile=apps/informant/dist/informant-linux-x64
   bun build apps/informant/src/cli.ts --compile --minify --target=bun-linux-arm64 --outfile=apps/informant/dist/informant-linux-arm64
   ```
2. **Hash** them:
   ```bash
   shasum -a 256 apps/informant/dist/informant-*
   ```
3. **Release**: create a GitHub Release tagged `vX.Y.Z` on
   `InformantDev/informant` and upload those four binaries as assets
   (asset names must stay `informant-<os>-<arch>`).
4. **Update** `Formula/informant.rb`: bump `version` and paste the four
   `sha256` values, then commit and push this repo.
5. **Verify**: `brew update && brew install informantdev/tap/informant`.

> The checksums in `Formula/informant.rb` match the **v0.1.0** binaries. The
> formula resolves after a `v0.1.0` release exists on `InformantDev/informant`
> with those exact assets uploaded.
