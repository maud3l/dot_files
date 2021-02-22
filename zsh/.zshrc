# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"
ZSH_THEME="spaceship"

# Spaceship configuration
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_EXIT_CODE_SHOW="true"
SPACESHIP_EXEC_TIME_SHOW="false"


# use vim key bindings
# bindkey -vi


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
 export UPDATE_ZSH_DAYS=14

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

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
plugins=(
	git
	z
	zsh-syntax-highlighting
	zsh-autosuggestions
	vi-mode
	colorize
	colored-man-pages
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# source env file
source $HOME/.env

# set jj as esc
bindkey jj vi-cmd-mode

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vi'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# go path
export PATH=$PATH:/usr/local/go/bin

# aliases
alias ip='ip --color=auto'
alias bc="bc -lq"
alias :q="exit"
alias :q!="exit"
alias copy="xclip -sel clip"
alias paste="xclip -sel c -o"
alias vpn="sudo -b openvpn --config /etc/openvpn/cW9CpLdAjfkF_tcp.ovpn >/dev/null 2>&1"
alias vpnk="sudo -b killall openvpn >/dev/null 2>&1"
alias pycharm="/usr/local/bin/pycharm-2019.3.4/bin/pycharm.sh > /dev/null &"
alias python="python3.8"
alias py="python3.8"
alias cal="cal -y"
alias desktop="ssh mauro@192.168.1.105"
alias rpi="ssh mauro@192.168.1.115"
alias SS='sudo systemctl'
alias rc='echo 0'
alias less='less -N --QUIT-AT-EOF --quit-if-one-screen '
# git alias
alias git-pull-recursive='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git stash ; git pull" \;'
alias g='git'
alias gc='git checkout'
alias gcm='git commit -m'
alias gwc='git whatchanged'
alias gp='git push'
alias gll='git pull'
alias gf='git fetch'
alias gst='git status'
alias gundo='git reset HEAD~'
alias cdr='cd $(git rev-parse --show-toplevel)' # cd to git Root

alias k='kubectl'
alias v='vim'
# buku
alias b='buku --suggest'
# task warrior
alias t='task'
alias tin='t in'
alias in='task add +in'
tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle
alias think='tickle +1d'


bindkey -v
bindkey ‘^R’ history-incremental-search-backward


#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Functions
#

# # ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tar.xz)    tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Clone terminal with current $PWD
#
clone () {
    mate-terminal --working-directory="$PWD"
}

# Simple function to get the current weather on your cli

weather(){
    if [[ $# -eq 0 ]]; then
        curl http://wttr.in
    else
        curl "http://wttr.in/$1?m"
    fi
}

# Find files in current directory
f() {
    q="*$1*"
    find . -iname $q
}

# make filename absolute
abs() { realpath $1 }

#Very often changing to a directory is followed by the ls command to list its contents. Therefore it is helpful to have a second function doing both at once. In this example we will name it cl (change list) and show an error message if the specified directory does not exist.

cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# mkdir and cd into it

mkcd() {
    mkdir -p "$@" && cd "$@";
}

# cd to tmp dir
cdtemp() {
    DATE=$(date +%m-%d-%Y-%H:%M)
    TMPDIR=$(mktemp --directory --suffix="-$DATE")
    cd "$TMPDIR"
}

# cp to tmp dir
cptemp() {
    local file="$1"
    DATE=$(date +%m-%d-%Y-%H:%M)
    TMPDIR=$(mktemp --directory --suffix="-$DATE")
    cp -r "$1" "$TMPDIR"
    echo "File $1 was copied to $TMPDIR"
}

newest() {
    if [ -z $1 ] ; then
        find . -type f \( ! -regex '.*/\..*' \) -print0 | xargs -0 stat -c "%Y:%n" | sort -n| tail -n 5 | cut -d ':' -f2-
    else
        find . -type f \( ! -regex '.*/\..*' \) -print0 | xargs -0 stat -c "%Y:%n" | sort -n| tail -n $1 | cut -d ':' -f2-
    fi
}

#Serve the current directory with Python's http.server.
# port "0" is a unix wildcard for any unallocated port.
serve() {
  python -m http.server 0
}

# Kubernetes
#[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)

# kube-ps1
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kube-ps1
source $HOME/.oh-my-zsh/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

get_cluster_short() {
 echo "$1"
}
