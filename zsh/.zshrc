# zsh
export ZSH="/Users/elliot/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="$PNPM_HOME:$PATH"
export PATH=/Users/elliot/flutter/bin:$PATH
export PATH=/Users/elliot/Library/Android/sdk/platform-tools:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH="$PATH:$(go env GOPATH)/bin"

# Google cloud
if [ -f '/Users/elliot/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/elliot/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/elliot/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/elliot/google-cloud-sdk/completion.zsh.inc'; fi

# non-PATH exports
export PNPM_HOME="/Users/elliot/Library/pnpm"
# export EDITOR="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color
export COLORTERM=truecolor

# aliases
alias vim='nvim'
alias lg='lazygit'

# https://github.com/joshmedeski/sesh?tab=readme-ov-file#zsh-keybind
# sesh
function sesh-sessions() {
   exec </dev/tty
  exec <&1
  local session
  session=$(
  sesh list --icons | fzf-tmux -p 100%,100% --no-border \
    --ansi \
    --list-border \
    --no-sort --prompt '⚡  ' \
    --color 'list-border:6,input-border:3,preview-border:4,header-bg:-1,header-border:6' \
    --input-border \
    --header-border \
    --header '^d tmux kill' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
    --preview-window 'right:70%' \
    --preview 'sesh preview {}'
  )
  [[ -z "$session" ]] && return
  sesh connect "$session"
}
bindkey "\e[99~" sesh-sessions
zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# https://yazi-rs.github.io/docs/quick-start/#shell-wrapper
# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# starship https://starship.rs/
eval "$(starship init zsh)"

# https://github.com/ajeetdsouza/zoxide
# zoxide (keep at bottom)
eval "$(zoxide init zsh)"

