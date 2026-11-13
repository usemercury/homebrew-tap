cask "mercury" do
  version "0.1.0"
  sha256 "2746894473738b2ebe852e0a03a446d94c7345f87dca7f4a5a8bfe64f64e0707"

  url "https://github.com/usemercury/mercury-releases/releases/download/v#{version}/Mercury_#{version}_universal.dmg"
  name "Mercury"
  desc "Desktop client for message brokers (Azure Service Bus first)"
  homepage "https://github.com/usemercury/mercury-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

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
