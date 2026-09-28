# Homebrew tap for Tokenmeter

[Tokenmeter](https://github.com/mugeshk97/tokenmeter) is a desktop widget that shows how much of your AI usage limits is left (Claude Code, Codex, Copilot, Gemini CLI, Grok and the Claude, OpenAI and xAI APIs).

```bash
brew install --cask mugeshk97/tap/tokenmeter
```

Update with `brew upgrade --cask tokenmeter`; remove with `brew uninstall --cask tokenmeter` (add `--zap` to also delete its settings).

Tokenmeter isn't signed with an Apple Developer ID yet, so macOS blocks its first launch: open **System Settings → Privacy & Security** and click **Open Anyway** next to Tokenmeter.

The cask is updated automatically by Tokenmeter's release workflow.
