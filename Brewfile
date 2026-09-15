# Brewfile — install everything with: brew bundle
# Curated from `brew bundle dump` on the personal MacBook (2026-09-15).

tap "arl/arl" # gitmux

# --- Core terminal environment (the dotfiles depend on these) ---
brew "neovim"
brew "tmux"
brew "arl/arl/gitmux" # git status in tmux status bar
brew "sesh"           # tmux session manager
brew "tmuxinator"
brew "fzf"
brew "starship"
brew "zoxide"
brew "yazi"
brew "lazygit"
brew "gh"
brew "git-delta"
brew "eza"
brew "bat"
brew "fd"
brew "ripgrep"
brew "jq"

# --- Toolchains ---
brew "go"
brew "rbenv"

# --- General utilities ---
brew "coreutils"
brew "wget"
brew "sevenzip"
brew "gum"
brew "ffmpeg"
brew "duti"
brew "gitleaks"
brew "trufflehog"

# --- Databases / services (uncomment what work needs) ---
# brew "mysql-client"
# brew "postgresql@14"
# brew "php"
# brew "python@3.9"
# brew "protobuf"
# brew "awscli"
# brew "lftp"
# brew "vips"
# brew "zellij"

# --- iOS / mobile dev (uncomment if needed at work) ---
# brew "cocoapods"
# brew "ideviceinstaller"
# brew "ios-deploy"

# --- Casks ---
cask "alacritty" # primary terminal (installed manually on the old machine, via brew here)
# cask "ghostty"
cask "font-hack-nerd-font"
cask "font-symbols-only-nerd-font"
cask "claude-code"
# cask "libreoffice"

# --- Apps (previously installed by hand on the old machine) ---
# Dev
cask "visual-studio-code"
cask "sublime-text"
cask "iterm2"
cask "docker-desktop"
cask "postman"
cask "mongodb-compass"
cask "mysqlworkbench"
cask "pgadmin4"
cask "postico"
cask "responsively"
# cask "android-studio"
# FileZilla has no cask — download from filezilla-project.org (or use lftp above)

# Browsers
cask "google-chrome"
cask "firefox"
# cask "arc"
cask "brave-browser"
cask "zen"

# Productivity / utilities
cask "1password"
cask "alfred"
cask "bettertouchtool"
cask "karabiner-elements"
cask "notion"
cask "obsidian"
cask "claude"
# cask "logi-options+"     # Logitech hardware
# pCloud Drive has no cask — download from pcloud.com

# Comms
cask "microsoft-teams"
cask "zoom"
# cask "discord"

# Other
# cask "openvpn-connect"   # work VPN client may differ
# cask "mactex"            # full TeX distribution, ~5GB

# --- Mac App Store apps (requires: signed into App Store) ---
brew "mas"
mas "Xcode", id: 497799835
mas "Slack for Desktop", id: 803453959
mas "Magnet", id: 441258766
mas "Amphetamine", id: 937984704
mas "Microsoft Word", id: 462054704
mas "Microsoft Excel", id: 462058435
mas "Microsoft OneNote", id: 784801555
mas "Trello", id: 1278508951
mas "DevCleaner for Xcode", id: 1388020431
mas "Keynote", id: 361285480
mas "Pages", id: 361309726
mas "Numbers", id: 361304891
# Personal, install if wanted: Amazon Kindle, Twitter, Timer, GarageBand, iMovie

# --- Go tools (mostly Go/protobuf dev helpers used by nvim) ---
go "golang.org/x/tools/gopls"
go "github.com/go-delve/delve/cmd/dlv"
go "github.com/fatih/gomodifytags"
go "github.com/cweill/gotests/gotests"
go "github.com/josharian/impl"
go "honnef.co/go/tools/cmd/staticcheck"
go "github.com/air-verse/air"
# go "github.com/spf13/cobra-cli"
# go "google.golang.org/protobuf/cmd/protoc-gen-go"
# go "google.golang.org/grpc/cmd/protoc-gen-go-grpc"
# go "github.com/google/gnostic/cmd/protoc-gen-openapi"

# --- npm globals ---
npm "pnpm"
npm "@antfu/ni"
npm "n"
# npm "yarn"
# npm "firebase-tools"
