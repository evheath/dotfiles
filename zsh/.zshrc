# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/elliot/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/elliot/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/elliot/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/elliot/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/elliot/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=/Users/elliot/flutter/bin:$PATH
export PATH=/Users/elliot/Library/Android/sdk/platform-tools:$PATH
export PATH=~/.npm-global/bin:$PATH


# pnpm
export PNPM_HOME="/Users/elliot/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export EDITOR="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
alias vim='nvim'
export XDG_CONFIG_HOME="$HOME/.config"

# select tmux sessions with Ctrl+s
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
bindkey "^S" sesh-sessions
zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# colors
export TERM=xterm-256color
export COLORTERM=truecolor

# https://github.com/ajeetdsouza/zoxide
# Add this to the end of your config file (usually ~/.zshrc):
eval "$(zoxide init zsh)"
