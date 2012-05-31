function zle-keymap-select {
  zle reset-prompt
}

zle -N zle-keymap-select

bindkey -v

# if mvim is installed use it for terminal
command -v mvim >/dev/null 2>&1 && {
  alias vim='mvim -v'
}
