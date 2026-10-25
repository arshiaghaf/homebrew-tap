cask "baseline" do
  version "0.10.0"
  sha256 "8b266fe175babdfb1c4080c8f095c4b2ae78171e992f3e6762527529f30ec5d3"

  url "https://github.com/arshiaghaf/Baseline/releases/download/v#{version}/Baseline-#{version}-unsigned.dmg"
  name "Baseline"
  desc "Manage app updates from App Store, Homebrew, Sparkle, and direct downloads"
  homepage "https://github.com/arshiaghaf/Baseline"

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
