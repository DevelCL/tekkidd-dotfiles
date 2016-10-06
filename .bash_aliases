export NODE_ENV="development"
export ALIASES="$HOME/.bash_aliases"

export TWITTER_CONSUMER_KEY="sJneuy1u9qyoYkGpKDmcAKxws"
export TWITTER_CONSUMER_SECRET="IPctD7mhqfCcKHlI1hTSUxdN2lnvW7RabcVaCP6CwEznJ7hrxa"
export TWITTER_TOKEN="224448389-ozbTHIvxFBe4AgkPs4PxpvzaHUFhkN5cXjApqLrL"
export TWITTER_TOKEN_SECRET="zsVke8fi2gAVnXgnGJFSh9mU5c7LMXR4WhS9Zb7tOTBfp"

#=========================================================================================================#
# ALIASES
#=========================================================================================================#

# unix
alias c="clear"
alias l="ls -gphlsX"
alias la="l -A"
alias lt="l -t"
alias lg="l | grep "
alias ll="la"
alias grep="grep --color=auto"
alias untar="tar xvf "
alias untarbz="tar xvjf "
alias lpath="env | grep PATH"

# files
alias salias="c && source $ALIASES"
alias calias="cat $ALIASES"
alias ealias="vim $ALIASES"
alias eprofile="vim $HOME/.profile"
alias sprofile=". $HOME/.profile"
alias ebashrc="vim $HOME/.bashrc"

# node
alias dev="npm run dev"
alias rs="reset && s"
alias nr="npm run reinstall"
alias ni="npm i"

# git
alias commit="git rev-parse HEAD"
# alias g="gaa; gcm 'QuickCommit'; gpl; gpo"
alias ga="git add"
alias gaa="git add --all :/"
alias gb="git branch"
alias gbls="git branch -a"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gplo="git pull origin"
alias gplom="git pull origin master"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gppo="gpl; gpo"
alias gpmpm="gplom && gpom"
alias grmls="git remote -v"
alias gs="git status"

# vagrant
alias ubuntu="cd; vagrant up; vagrant ssh"


function g {
    git add -A;
    git commit -am "${1}";
    git push origin; git status;
}
function gclone {
    git clone git@github.com:"${1}".git
}

# command line formatting
# PS1="${debian_chroot:+($debian_chroot)}\[$LITEGREEN\]\u@\h\[$WHITE\]:\[$LITEBLUE\]\W\[$WHITE\] $ "

source $HOME/dotfiles/bash/prompt.sh
