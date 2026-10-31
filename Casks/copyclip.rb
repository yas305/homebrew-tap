# Homebrew cask for CopyClip, for a personal tap (homebrew/cask needs more GitHub
# popularity for a self-submission). Publish it as Casks/copyclip.rb in a public
# GitHub repo named homebrew-tap, then users install with:
#   brew install --cask <github-user>/tap/copyclip
# On each release, bump `version` and set `sha256` to the DMG's hash
# (the "sha256" in website/public/releases/latest.json).
cask "copyclip" do
  version "1.16.0"
  sha256 "a7d9e40842aee530a4ecd69bb6689e8ad5f7a83cac99e94115524a7d13d94b9a"

  url "https://copyclip.app/releases/CopyClip-#{version}.dmg"
  name "CopyClip"
  desc "Clipboard history with actions for whatever you copy"
  homepage "https://copyclip.app/"

  livecheck do
    url "https://copyclip.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "CopyClip.app"

  uninstall quit: "com.copyclip.app"

  zap trash: [
    "~/Library/Application Support/*/*/NativeMessagingHosts/app.copyclip.bridge.json",
    "~/Library/Application Support/*/NativeMessagingHosts/app.copyclip.bridge.json",
    "~/Library/Application Support/CopyClip",
    "~/Library/Caches/com.copyclip.app",
    "~/Library/HTTPStorages/com.copyclip.app",
    "~/Library/Preferences/com.copyclip.app.plist",
  ]
end
