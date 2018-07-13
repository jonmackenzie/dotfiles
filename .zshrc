# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# Custom prompt
# PROMPT='%B%F{green}[%m] %F{yellow}%n %F{blue}%1~%b %F{grey}$ '

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH=/Users/jon/.nvm/versions/node/v8.2.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/Users/jon/.vimpkg/bin

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias psg='ps aux | grep '

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

alias c='clear'
alias cl='clear; l'

alias claer='clear; echo LEARN TO TYPE YA CLUMSY BASTARD'
alias celar='clear; echo LEARN TO TYPE YA CLUMSY BASTARD'
alias cleqr='clear; echo LEARN TO TYPE YA CLUMSY BASTARD'
alias celqr='clear; echo LEARN TO TYPE YA CLUMSY BASTARD'
alias clera='clear; echo LEARN TO TYPE YA CLUMSY BASTARD'
alias caler='clear; echo LEARN TO TYPE YA CLUMSY BASTARD'

alias sshcs='ssh j_mackenzie@cs.smu.ca'
alias ssh4477='ssh jd_mackenzie@csci4477.cs.smu.ca'
alias ssh3451='ssh u39@csci4423.cs.smu.ca'
alias sshbl='ssh 173.212.92.103 -p 4022'
alias sshbl1234='ssh 173.212.92.103 -p 4022 -n -L 1234:localhost:27017'

alias serve='sudo php -S 0.0.0.0:80 -t '
alias brewup='echo "updating..."; brew update; echo "upgrading..."; brew upgrade; echo "pruning..."; brew prune; echo "cleaning up..."; brew cleanup; echo "done";'
alias brewupv='echo "updating..."; brew update -v; echo "upgrading..."; brew upgrade -v; echo "pruning..."; brew prune -v; echo "cleaning up..."; brew cleanup -v; echo "done";'
alias upd='brewup'
alias ip='ipconfig getifaddr en0'

alias blwatch="~/.scripts_etc/bl/watch.sh"
alias dscompile="browserify -v -t hbsfy ~/flooma/resources/ajax/doorstep.js > ~/flooma/resources/ajax/compiled/doorstep.js"

eval $(thefuck --alias)

alias starwars='telnet towel.blinkenlights.nl'

alias weather='curl wttr.in/halifax?m'

alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

alias rm='trash'

alias tensorflow='echo "entering tensorflow, exit with deactivate"; source ~/tensorflow/bin/activate'

alias lolsl='sl | clolcat'

alias setoolkit='cd /usr/local/set; sudo ./setoolkit; cd'

alias bl='cd ~/flooma; vim'

# htop crashes system without root (from github issue)
alias htop='sudo htop'

alias abolish='vim ~/.vim/after/plugin/abolish.vim'

alias rsfconsole="cd ~/routersploit; python3 rsf.py"

alias a="git add"
alias aa="git add *"
alias com="git commit"
alias s="git status"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
