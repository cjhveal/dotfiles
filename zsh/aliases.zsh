alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

cd () {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../../..
  else
    builtin cd "$@"
  fi
}

alias _='sudo'

alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls

alias md='mkdir -p'

alias reload!='. ~/.zshrc'

function mcd() {
  mkdir -p "$1" && cd "$1";
}

function cdl() {
  cd "$1" && l
}


alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"
alias localip='ipconfig getifaddr en0'
