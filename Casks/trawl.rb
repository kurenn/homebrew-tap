cask "trawl" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "6a97b8a4f7585bef463b29c16465b0b37a1751c680b31c4552bf07cec352c3b1",
         intel: "8132655d4722e60ca746610385d58a6be0962a3dcceba85eb59eeb7bd09a838c"

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
