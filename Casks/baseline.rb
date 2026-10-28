cask "baseline" do
  version "0.11.0"
  sha256 "eedc426a2db62e25f22c7b0ecc3448a232dcea9a56175dcb33ec73c4fae2cb10"

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
