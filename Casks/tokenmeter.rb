cask "tokenmeter" do
  arch arm: "arm64", intel: "x64"

  version "1.0.2"
  sha256 arm:   "24b83b13f19f8adbfab695ee42b4404eb412299841baa2de113d388b90d4e248",
         intel: "48158efe123970cb8825817d2dfc246a268123f221ed2a96c4dce9f58fd3e4f6"

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
