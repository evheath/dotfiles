# New machine setup

Steps to get this environment running on a fresh Mac.

## 1. Prerequisites

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 2. oh-my-zsh

`.zshrc` sources it first thing and errors without it:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

(It will overwrite `~/.zshrc` with its own — that's fine, `install.sh` replaces it next.)

## 3. Clone and link

```sh
mkdir -p ~/code && cd ~/code
git clone https://github.com/evheath/dotfiles.git
cd dotfiles
./install.sh
```

## 4. Packages

```sh
brew bundle   # from the repo root; uncomment optional sections in Brewfile first as needed
```

## 5. Git identity (do NOT copy ~/.gitconfig from the old machine)

The old machine's `~/.gitconfig` contains a token and the personal email.
Recreate it cleanly, with the work identity where appropriate:

```sh
git config --global user.name "Elliot Heath"
git config --global user.email "<work email>"
git config --global core.excludesfile ~/.config/git/ignore
gh auth login   # use this (or a credential helper) instead of tokens in gitconfig
```

## 6. tmux plugins (TPM)

Plugins live in `~/.config/tmux/plugins/` and are not tracked here:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then start tmux and press `<prefix> I` to install the rest
(catppuccin, gitmux, battery, cpu, sensible, which-key, vim-tmux-navigator).

## 7. Neovim

Just open `nvim` — Lazy installs plugins and Mason installs LSPs on first launch.

## 8. Toolchains (install only what this machine needs)

`.zshrc` references these but guards or tolerates their absence:

- **node**: `brew install n && n lts` (don't repeat the old machine's /usr/local pkg install)
- **pnpm / bun**: `npm i -g pnpm` / `curl -fsSL https://bun.sh/install | bash`
- **ruby**: `rbenv install <version>` (rbenv itself comes from the Brewfile)
- **gcloud**: install to `~/google-cloud-sdk` (the `.zshrc` guards no-op if absent)
- **flutter / Android SDK**: expected at `~/flutter` and `~/Library/Android/sdk`
- **preftz-cli**: personal project, expected at `~/code/ftz/preftz-cli` — skip if N/A

## 9. Fonts / terminal

Ghostty and the Hack Nerd Font come from the Brewfile. The `alacritty/`
config in this repo is legacy and only linked for completeness.
