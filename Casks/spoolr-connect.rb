cask "spoolr-connect" do
  version "0.8.1"
  sha256 "835d663650cc83797434a97d1822d967e7336e522efa36ec3ceb1290ca8c8863"

  url "https://github.com/kurenn/printer-connector/releases/download/v#{version}/SpoolrConnect-macos.zip",
      verified: "github.com/kurenn/printer-connector/"
  name "Spoolr Connect"
  desc "Menu-bar connector bridging LAN 3D printers to Spoolr"
  homepage "https://www.spoolr.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app ships its own updater (UpdateChecker), so let it self-update rather
  # than have `brew upgrade` fight it.
  auto_updates true
  depends_on macos: :sonoma

  app "Spoolr Connect.app"

  # Ad-hoc signed, not notarized: clear the download quarantine so Gatekeeper
  # doesn't flag the app as "damaged". Remove once signed + notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Spoolr Connect.app"]
  end

  zap trash: [
    "~/Library/Application Support/Spoolr",
    "~/Library/Caches/io.spoolr.connect",
    "~/Library/Preferences/io.spoolr.connect.plist",
  ]
end
