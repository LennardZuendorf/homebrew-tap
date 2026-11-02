# Shards Homebrew tap

Install the CLI and the actual MCP executable:

```sh
brew install LennardZuendorf/tap/shards-cli
```

Install the desktop app plus the CLI/MCP dependency:

```sh
brew install --cask LennardZuendorf/tap/shards
```

The formula owns `shards`, `shards-mcp` and shell completions. The app contains
private tools matching its version. Removing the app leaves the formula installed.
Crystal's `crystal` formula also installs `shards` and conflicts with this formula. Select which executable
you want before installing; do not force-overwrite another package's links.

Requires macOS 13.3 or later. These releases have no Developer ID signature or
Apple notarization. If macOS blocks the first launch, use System Settings →
Privacy & Security → Open Anyway. See [Apple's instructions](https://support.apple.com/en-us/102445).
The packages do not disable Gatekeeper or remove quarantine.

`brew upgrade` obtains newer fixed releases. `brew uninstall --cask shards`
removes the app. `brew uninstall shards-cli` removes the tools. No uninstall or
zap hook deletes a vault or configuration. Back up your data before changing
versions. A rollback requires retained, verified release bytes; never replace
an existing version tag or download.

Definitions are generated from the verified release manifest in
[LennardZuendorf/shards](https://github.com/LennardZuendorf/shards).
Version 0.1.0. Candidate-local definitions are for disposable native CI only.
Public installation is available only after the release and this tap are published.
