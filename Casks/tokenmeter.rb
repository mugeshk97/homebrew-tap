cask "tokenmeter" do
  arch arm: "arm64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "ff2bb2b0b3191ca7820bafb5fdb78148480dbd1f24f51a3b908eb779b125fd70",
         intel: "e940a9a087decc9801d610a79c62cb3d1cb7028b17773c741223fba0f3d951d4"

  url "https://github.com/mugeshk97/tokenmeter/releases/download/v#{version}/tokenmeter-#{version}-#{arch}.dmg"
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
