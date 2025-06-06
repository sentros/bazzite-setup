# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# --- ZSH SETTINGS ---
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS     # Don’t record duplicate commands
setopt HIST_FIND_NO_DUPS    # Don’t display duplicates in history search
setopt SHARE_HISTORY        # Share history across sessions

autoload -Uz compinit && compinit   # Enable tab completion
autoload -Uz colors && colors       # Enable color support

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sentros"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo zsh-autosuggestions fast-syntax-highlighting)

# Oh my zsh
source $ZSH/oh-my-zsh.sh

# LANG
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# ulimit
ulimit -n 4096

# Aliases
alias 'password=openssl rand -base64 15'
alias 'headers=http --follow --all -h'
alias 'k=kubectl'

alias cat='bat'
alias nano='nano -c'
alias ls='eza -lagh'

# --- FZF HISTORY WIDGET ---
fzf-history-widget() {
  local selected
  selected=$(fc -rl 1 | fzf --no-sort --tac --ansi \
    --preview 'echo {} | sed "s/^[[:space:]]*[0-9]\+[[:space:]]*//" | bat --language=bash --style=plain --color=always' \
    --preview-window=down:3:wrap)
  if [[ -n "$selected" ]]; then
    BUFFER=$(echo "$selected" | sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//')
    CURSOR=${#BUFFER}
    zle reset-prompt
  fi
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget  # Bind Ctrl+R

# --- OPTIONAL: MORE FZF SETTINGS ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # Peco history selection
# function peco-history-selection() {
#   local tac
#   if which tac > /dev/null; then
#     tac="tac"
#   else
#     tac="tail -r"
#   fi
#   BUFFER=$(history -10000 | eval $tac | cut -c 8- | peco --query "$LBUFFER")
#   CURSOR=$#BUFFER
# }
# zle -N peco-history-selection
# bindkey '^R' peco-history-selection

# Default editor nano
export EDITOR='nano'

# homebrew to path
export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

# no brew analyticts
HOMEBREW_NO_ANALYTICS=1

# cleanup terraform
function terraclean () {
  rm -rf .terraform .terragrunt-cache .terraform.lock.hcl *.autogen.tf;  ls -1 | while read d; do test -d "$d" || continue; echo $d; (cd $d ; rm -rf .terraform .terragrunt-cache .terraform.lock.hcl *.autogen.tf); done
}

# ptyxis notifications
source /etc/profile.d/vte.sh

# --- FINAL TOUCHES ---
setopt auto_cd       # cd by just typing the dir name
setopt correct       # autocorrect minor spelling errors in commands
setopt nocaseglob    # case-insensitive globbing
