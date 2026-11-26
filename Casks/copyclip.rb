# Homebrew cask for CopyClip, published in the yas305/homebrew-tap repo as
# Casks/copyclip.rb (homebrew/cask needs more GitHub popularity for a
# self-submission). Users install with:
#   brew install --cask yas305/tap/copyclip
# On each release, bump `version` and set `sha256` to the DMG's hash (the
# "sha256" in website/public/releases/latest.json), here and in the tap repo.
cask "copyclip" do
  version "1.19.0"
  sha256 "e8bef2442e0c39e4fd876a044549932d2cd62a05a1f35c7d48be969eeb6a8895"

  url "https://copyclip.app/releases/CopyClip-#{version}.dmg"
  name "CopyClip"
  desc "Clipboard history with actions for whatever you copy"
  homepage "https://copyclip.app/"

  livecheck do
    url "https://copyclip.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

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
