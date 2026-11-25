cask "dormer" do
  version "0.6.1,35"
  sha256 "938cf99d8b895428e0213bcb1bb1ad4b7109599c96c856d6aa5c16f1ed5e9fac"

  url "https://github.com/Zerdoxy741/dormer/releases/download/v#{version.csv.second}/Dormer-#{version.csv.first}.zip"
  name "Dormer"
  desc "Notch app for MacBooks: music, calendar, shelf, companion and more"
  homepage "https://dormernotch.com/"

  # Tag GitHub « v35 » = numéro de build, titre « Dormer 0.6.1 » = version affichée
  livecheck do
    url :url
    strategy :github_latest do |json|
      build = json["tag_name"]&.delete_prefix("v")
      shown = json["name"]&.delete_prefix("Dormer ")&.strip
      next if build.blank? || shown.blank?

      "#{shown},#{build}"
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Dormer/Dormer.app"

  zap trash: [
    "~/Library/Application Support/Dormer",
    "~/Library/Application Support/Notchy",
    "~/Library/Caches/local.notchy.app",
    "~/Library/Logs/Dormer",
    "~/Library/Preferences/local.notchy.app.plist",
  ]
end
