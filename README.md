# Homebrew tap for Mercury

[Mercury](https://github.com/usemercury/mercury-app) is a desktop client for
message brokers (Azure Service Bus first).

```sh
brew install --cask usemercury/tap/mercury
```

Upgrades come with `brew upgrade --cask mercury`.

Mercury is not notarised by Apple yet. If macOS says it cannot be opened,
allow it once in System Settings → Privacy & Security, or run:

```sh
xattr -dr com.apple.quarantine "/Applications/Mercury.app"
```

## How this tap is updated

Do not edit `Casks/mercury.rb` by hand. When a Mercury release is
published, the **Packages** workflow in `usemercury/mercury-app` writes the
cask (version, download URL and SHA-256 of the release's `.dmg`) and pushes
it here, using the `HOMEBREW_TAP_TOKEN` secret of that repository.
