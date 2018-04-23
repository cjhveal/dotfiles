export PATH="${HOME}/bin:$PATH"

# enable colors in terminal
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# editor & pager
export LESS="--hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --hilite-unread --window=-5"
export PAGER="LESS"
export EDITOR="nvim"

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

export GPG_TTY=$(tty)
