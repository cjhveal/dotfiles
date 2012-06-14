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
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

alias mksshkey="ssh-keygen -b 8192 -t rsa -C '$1' -f ~/.ssh/$1.rsa"

function murder () {
  ps | grep $1 | grep -v grep | awk '{print $1}' | xargs kill -9
}

alias gz='tar -zcvf'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
