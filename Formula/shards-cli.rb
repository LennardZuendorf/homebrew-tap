class ShardsCli < Formula
  desc "Markdown task manager and MCP server for humans and agents"
  homepage "https://github.com/LennardZuendorf/shards"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/LennardZuendorf/shards/releases/download/v0.1.0/shards-cli-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4b5ea28ec514e9b1e9b5f4b1357d5650eaf7a6542b95200f62be8d7222dc920c"
    end
    on_intel do
      url "https://github.com/LennardZuendorf/shards/releases/download/v0.1.0/shards-cli-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "090477d9550bc73d705a7856fe2360fd0ab8ffa7b4d184bae1820e92fee2194c"
    end
  end
  conflicts_with "crystal", because: "both install a shards executable"

  def install
    bin.install "bin/shards", "bin/shards-mcp"
    bash_completion.install "completions/shards.bash" => "shards"
    zsh_completion.install "completions/_shards"
    fish_completion.install "completions/shards.fish"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/shards --version").strip
    assert_path_exists bin/"shards-mcp"
    (testpath/"config.toml").write <<~TOML
      [core]
      vault_path = "#{testpath}/vault"
    TOML
    mkdir testpath/"vault"
    with_env(SHARDS_CONFIG_PATH: (testpath/"config.toml").to_s) do
      assert_match "notes", shell_output("#{bin}/shards --json status")
    end
  end
end
