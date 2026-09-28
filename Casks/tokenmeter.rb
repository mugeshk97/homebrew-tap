cask "tokenmeter" do
  arch arm: "arm64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "1e12a4e37f7660f73679ad28666157159f5f4f30f853efa6b59431ca17e7537f",
         intel: "1b3c502be16718d26f0dfd4f3f726e9c622b1d2b0063b9ba09f12935419e2c9e"

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
