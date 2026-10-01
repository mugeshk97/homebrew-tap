cask "tokenmeter" do
  arch arm: "arm64", intel: "x64"

  version "1.0.3"
  sha256 arm:   "581db84d22794f3874d01bcf97b9b55f8b4ae3be6ef6b13f8f367b38f3201431",
         intel: "536ef0fbffa6da7ac58494bf560833bf1dd0107d55eaf0ddbf8915cde79ae392"

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
