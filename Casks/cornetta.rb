cask "cornetta" do
  version "0.3.4"
  sha256 "0ab8789fdd82ea450c78806c1f35ed17d64c2ebaa469d28784c8d47e7469a63e"

  url "https://cornetta.stellakamikaze.org/downloads/Cornetta-#{version}.dmg"
  name "Cornetta"
  desc "Call recorder: your voice and the others' in one file, with any app"
  homepage "https://cornetta.stellakamikaze.org/"

  livecheck do
    url "https://cornetta.stellakamikaze.org/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Cornetta.app"

  zap trash: [
    "~/Library/Application Support/Cornetta",
    "~/Library/Caches/com.stellakamikaze.cornetta",
    "~/Library/HTTPStorages/com.stellakamikaze.cornetta",
    "~/Library/Logs/Cornetta",
    "~/Library/Preferences/com.stellakamikaze.cornetta.plist",
  ]

  caveats <<~EOS
    Cornetta is free and not notarized by Apple. On first launch macOS blocks it:
    open System Settings > Privacy & Security and click "Open Anyway". Once is enough.
    Recordings go to ~/Music/Cornetta and never leave your Mac.
  EOS
end
