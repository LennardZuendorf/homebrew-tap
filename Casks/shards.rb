cask "shards" do
  arch arm: "aarch64-apple-darwin", intel: "x86_64-apple-darwin"

  version "0.1.0"
  sha256 arm:   "b62ce871c958be595d3159b5fbad887a67d998209c5044e473ad7da47cfbf592",
         intel: "8dbd90e2063a13587cea1f6e3a5f330ecd233dbd83c26bdc39085011ff261a02"

  url "https://github.com/LennardZuendorf/shards/releases/download/v0.1.0/Shards-0.1.0-#{arch}.dmg"
  name "Shards"
  desc "Multiplayer Markdown task manager for humans and agents"
  homepage "https://github.com/LennardZuendorf/shards"

  depends_on formula: "LennardZuendorf/tap/shards-cli"
  depends_on macos: :ventura

  app "Shards.app"

  # Homebrew release dependencies cannot express the required minor-version floor.
  odie "Shards requires macOS 13.3 or later." if MacOS.version < MacOSVersion.new("13.3")

  caveats <<~EOS
    Requires macOS 13.3 or later.
    This application has no Developer ID signature or Apple notarization.
    If macOS blocks the first launch, use System Settings > Privacy & Security > Open Anyway.
  EOS
end
