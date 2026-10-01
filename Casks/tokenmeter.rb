cask "tokenmeter" do
  arch arm: "arm64", intel: "x64"

  version "1.0.4"
  sha256 arm:   "359787d15224cbe819ed51f92639797da13b773009103aeeb1bb097081618d0e",
         intel: "1aa25ff1e7dd8d8c10090593ccf034aa9b998c35860cf0ef9d7d41f176dafcdc"

  url "https://github.com/mugeshk97/tokenmeter/releases/download/v#{version}/tokenmeter-#{version}-#{arch}.zip"
  name "Tokenmeter"
  desc "Desktop widget showing how much of your AI usage limits is left"
  homepage "https://github.com/mugeshk97/tokenmeter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Tokenmeter.app"

  zap trash: [
    "~/Library/Application Support/Tokenmeter",
    "~/Library/Caches/tokenmeter-updater",
    "~/Library/Logs/Tokenmeter",
    "~/Library/Preferences/dev.mugesh.tokenmeter.plist",
    "~/Library/Saved Application State/dev.mugesh.tokenmeter.savedState",
  ]

  caveats <<~EOS
    Tokenmeter isn't signed with an Apple Developer ID yet, so macOS blocks its
    first launch. Open System Settings > Privacy & Security and click
    "Open Anyway" next to Tokenmeter. You only need to do this once per version.

    Tokenmeter runs from the menu bar. Update it with:
      brew upgrade --cask tokenmeter
  EOS
end
