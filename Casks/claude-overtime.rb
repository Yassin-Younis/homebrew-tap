cask "claude-overtime" do
  version "1.0.0"
  sha256 "6ae7bc06f30dca8e28d08677dbc46da54166977c5f3e66c9d4f5fc54b7875b07"

  url "https://github.com/Yassin-Younis/claude-overtime/releases/download/v#{version}/ClaudeOvertime.app.zip"
  name "Claude Overtime"
  desc "Keeps your Mac awake while agentic CLIs run, even with the lid closed"
  homepage "https://github.com/Yassin-Younis/claude-overtime"

  depends_on arch: :arm64

  app "ClaudeOvertime.app"

  zap trash: [
    "~/.config/claude-overtime.conf",
    "~/Library/LaunchAgents/com.claudeovertime.app.plist",
  ]

  caveats <<~EOS
    The app is ad-hoc signed. If you installed without --no-quarantine,
    right-click the app -> Open on first launch.

    Lid-closed support installs a root helper from inside the app
    (one admin-password prompt). Remove everything with:
      sudo bash "$(brew --prefix)/Caskroom/claude-overtime/#{version}/uninstall.sh"
    or from a cloned repo: sudo bash uninstall.sh
  EOS
end
