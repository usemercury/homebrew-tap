cask "mercury" do
  version "0.4.0"
  sha256 "19f3122284605d53e37228253d86d44b066ecb39c20081b70efba958ab03bf60"

  url "https://github.com/usemercury/mercury-releases/releases/download/v#{version}/Mercury_#{version}_universal.dmg"
  name "Mercury"
  desc "Desktop client for message brokers (Azure Service Bus first)"
  homepage "https://github.com/usemercury/mercury-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Mercury updates itself (title bar > Update), so `brew upgrade` leaves it alone.
  auto_updates true

  app "Mercury.app"

  zap trash: [
    "~/Library/Application Support/app.usemercury.desktop",
    "~/Library/Logs/app.usemercury.desktop",
  ]

  caveats <<~EOS
    Mercury is not notarised by Apple yet. If macOS says it cannot be opened,
    allow it once in System Settings > Privacy & Security, or run:
      xattr -dr com.apple.quarantine "/Applications/Mercury.app"
  EOS
end
