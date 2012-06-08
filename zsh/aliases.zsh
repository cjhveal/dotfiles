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
alias l='ls -lah'
alias ll='ls -l'
alias sl=ls

alias md='mkdir -p'


function mcd() {
  mkdir -p "$1" && cd "$1";
}

function cdl() {
  cd "$1" && l
}

function ..l() {
  cd .. && l
}

alias reload!='. ~/.zshrc'

alias a='ack'
alias oo='open .'

alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"
alias localip='ipconfig getifaddr en0'
alias whois="whois -h whois-servers.net"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

function murder () {
  ps | grep $1 | grep -v grep | awk '{print $1}' | xargs kill -9
}
