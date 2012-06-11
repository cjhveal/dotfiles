# matches case insensitive for lowercase, then partial word, then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# add colors to completions
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
