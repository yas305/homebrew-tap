# Homebrew cask for CopyClip, published in the yas305/homebrew-tap repo as
# Casks/copyclip.rb (homebrew/cask needs more GitHub popularity for a
# self-submission). Users install with:
#   brew install --cask yas305/tap/copyclip
# On each release, bump `version` and set `sha256` to the DMG's hash (the
# "sha256" in website/public/releases/latest.json), here and in the tap repo.
cask "copyclip" do
  version "1.18.2"
  sha256 "6786f5eaeeb78906b8eadf9d6e4a7cf3f6205d67ea3eaa59d82726b5cfb3e3c2"

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
