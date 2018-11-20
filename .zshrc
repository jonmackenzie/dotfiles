# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    sudo       # esc twice prepends command with sudo
)

[[ -f ~/.zsh-local ]] && . ~/.zsh-local # for anything machine-specific
source $ZSH/oh-my-zsh.sh

# hopefully mostly universally useful (or at least usable) stuff

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias psg='ps aux | grep '

alias df='df -h'
alias du='du -h'
alias dus='du -hs'

alias lsl='ls -hl '
alias ll='ls -hl '
alias l='ls -hl '
alias la='ls -Ahl '
alias lt='ls -hlt '
alias lr='ls -hltr '
alias lta='ls -Ahlt '
alias lra='ls -Ahltr '

alias a="git add"
alias aa="git add *"
alias com="git commit"
alias s="git status"

alias c='clear'
alias cl='clear; l'
alias cs='clear; git status'

# safe copy/ move
alias cp='cp -i -r'
alias mv='mv -i'

alias serve='sudo php -S 0.0.0.0:80 -t '

alias starwars='telnet towel.blinkenlights.nl' # very important

alias weather='curl wttr.in/halifax?m'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

alias tensorflow='echo "entering tensorflow, exit with deactivate"; source ~/tensorflow/bin/activate'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias :q="exit"
alias :qa="tmux kill-window"

alias cp="cp -r"

alias vi="vim"

config config status.showUntrackedFiles no

