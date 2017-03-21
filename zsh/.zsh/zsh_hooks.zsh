autoload -Uz vcs_info
zstyle ':vcs_info:git*' actionformats "$PR_MAGENTA(%b) %a%{$reset_color%}"
zstyle ':vcs_info:git*' formats "$PR_MAGENTA(%b)%{$reset_color%}"
zstyle ':vcs_info:*' enable git svn

precmd() {
    vcs_info
}
