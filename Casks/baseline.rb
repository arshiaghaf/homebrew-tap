cask "baseline" do
  version "0.3.0"
  sha256 "054b6fdd99983ef36df6e5463a8df5545da684c86b8e383f29b480c2eec756f3"

  url "https://github.com/arshiaghaf/Baseline/releases/download/v#{version}/Baseline-#{version}-unsigned.dmg"
  name "Baseline"
  desc "Manage app updates from App Store, Homebrew, Sparkle, and direct downloads"
  homepage "https://github.com/arshiaghaf/Baseline"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Baseline.app"

  zap trash: [
    "~/Library/Application Support/Baseline",
    "~/Library/Caches/com.arshiaghaf.baseline",
    "~/Library/Logs/Baseline",
    "~/Library/Preferences/com.arshiaghaf.baseline.plist",
    "~/Library/Saved Application State/com.arshiaghaf.baseline.savedState",
  ]
end
