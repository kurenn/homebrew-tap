cask "trawl" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "64a5d64432adef82d1001f807f100e2f0e7870a9192dc324cc765d7173c56736",
         intel: "30855026128b0dce70dc7d73999e5817798e4ac99f4ab4bc011da2b9887d6433"

  url "https://github.com/kurenn/trawl/releases/download/v#{version}/Trawl_#{version}_#{arch}.dmg",
      verified: "github.com/kurenn/trawl/"
  name "Trawl"
  desc "Sync Google Drive & pCloud folders by link into a local library (rclone-backed)"
  homepage "https://github.com/kurenn/trawl"

  # rclone ships inside the app as a Tauri sidecar — no separate dependency.

  app "Trawl.app"

  zap trash: [
    "~/Library/Application Support/com.trawl.app",
  ]
end
