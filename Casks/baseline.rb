cask "baseline" do
  version "0.6.3"
  sha256 "fcb430155afcba4f60123eebded0f6cefdcdafb25b35880dd9fda2814e49d88a"

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
