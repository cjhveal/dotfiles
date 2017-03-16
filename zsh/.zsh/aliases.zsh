alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

alias l='ls -lah'

function cdl() {
  cd "$1" && l
}

function ..l() {
  cd .. && l
}

alias md='mkdir -p'

function mcd() {
  mkdir -p "$1" && cd "$1";
}

alias reload='. ~/.zshrc'
alias reload!='zplug clear && . ~/.zshrc'

# git aliases

alias ga='git add'
alias gap='git add --patch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --cached'
alias gl='git pull'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push'
alias gst='git status'

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'
