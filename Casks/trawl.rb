cask "trawl" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 :no_check # unsigned build; bump `version` per release (see repo README)

  url "https://github.com/kurenn/trawl/releases/download/v#{version}/Trawl_#{version}_#{arch}.dmg",
      verified: "github.com/kurenn/trawl/"
  name "Trawl"
  desc "Sync Google Drive & pCloud folders by link into a local library (rclone-backed)"
  homepage "https://github.com/kurenn/trawl"

  # rclone ships inside the app as a Tauri sidecar — no separate dependency.

  app "Trawl.app"

  # Unsigned build: clear the download quarantine so Gatekeeper doesn't flag the
  # app as "damaged". Remove once Trawl is signed + notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Trawl.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.trawl.app",
  ]
end
