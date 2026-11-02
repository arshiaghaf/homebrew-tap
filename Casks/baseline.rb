cask "baseline" do
  version "0.12.0"
  sha256 "6dcfa811edbeb75822decb7231044d9bee0f0cf6de740539bdcab64c9c13270d"

  url "https://github.com/arshiaghaf/baseline/releases/download/v#{version}/Baseline-#{version}-unsigned.dmg"
  name "Baseline"
  desc "Manage app updates from App Store, Homebrew, Sparkle, and direct downloads"
  homepage "https://github.com/arshiaghaf/baseline"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Baseline.app"

  zap trash: [
    "~/Library/Application Support/Baseline",
    "~/Library/Caches/com.arshiaghaf.baseline",
    "~/Library/Logs/Baseline",
    "~/Library/Preferences/com.arshiaghaf.baseline.plist",
    "~/Library/Saved Application State/com.arshiaghaf.baseline.savedState",
  ]
end
