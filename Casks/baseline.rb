cask "baseline" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/arshiaghaf/baseline/releases/download/v#{version}/Baseline-#{version}-unsigned.dmg",
      verified: "github.com/arshiaghaf/baseline/"
  name "Baseline"
  desc "Manage app updates from App Store, Homebrew, Sparkle, and direct downloads"
  homepage "https://github.com/arshiaghaf/baseline"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Baseline.app"

  zap trash: [
    "~/Library/Application Support/Baseline",
    "~/Library/Caches/com.arshia.baseline",
    "~/Library/Logs/Baseline",
    "~/Library/Preferences/com.arshia.baseline.plist",
    "~/Library/Saved Application State/com.arshia.baseline.savedState",
  ]
end
