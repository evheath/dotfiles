#!/usr/bin/env bash
#
# Symlinks the configs in this repo into their expected locations.
# Idempotent: correct existing links are skipped; anything else in the
# way is moved aside to <name>.backup before linking.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

link() {
  local target="$DOTFILES/$1" dest="$2"

  if [ ! -e "$target" ]; then
    echo "SKIP    $dest (missing target $target)"
    return
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$target" ]; then
    echo "OK      $dest"
    return
  fi

  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "BACKUP  $dest -> $dest.backup"
    mv "$dest" "$dest.backup"
  fi

  ln -s "$target" "$dest"
  echo "LINKED  $dest -> $target"
}

# Whole-directory links
link nvim        "$CONFIG/nvim"
link sesh        "$CONFIG/sesh"
link tmuxinator  "$CONFIG/tmuxinator"
link alacritty   "$CONFIG/alacritty" # legacy, superseded by ghostty

# Single-file links (parent dirs hold untracked state, e.g. tmux plugins)
link zsh/.zshrc            "$HOME/.zshrc"
link starship/starship.toml "$CONFIG/starship.toml"
link tmux/tmux.conf        "$CONFIG/tmux/tmux.conf"
link tmux/.gitmux.conf     "$CONFIG/.gitmux.conf"
link ghostty/config        "$CONFIG/ghostty/config"
link git/ignore            "$CONFIG/git/ignore"
link lazygit/config.yml    "$CONFIG/lazygit/config.yml"
link yazi/yazi.toml        "$CONFIG/yazi/yazi.toml"
link yazi/theme.toml       "$CONFIG/yazi/theme.toml"
link preftz/config.yml     "$CONFIG/preftz/config.yml"

echo
echo "Done. See SETUP.md for the remaining manual steps."
