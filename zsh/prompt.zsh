autoload colors && colors

function prompt_character {
  if [[ -z $KEYMAP ]]; then
    echo '>'
  fi
  echo "${${KEYMAP/vicmd/○}/(main|viins)/>}"
}

local user='%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$reset_color%}'
local host=''
if [[ -n $SSH_CONNECTION ]]; then
  host='@%{$fg[yellow]%}%m%{$reset_color%}'
fi
local dir='%{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%}'
local ruby_ver=''
if which rbenv &> /dev/null; then
  ruby_ver='%{$fg[red]%}‹$(rbenv version-name)›%{$reset_color%}'
else
  if which rvm-prompt &> /dev/null; then
    ruby_ver='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_ahead)$(git_prompt_status)%{$reset_color%}$(git_prompt_info)'
local prompt_char='$(prompt_character)'

local time='%{$fg[cyan]%}[%D{%-m/%f %Kh%M}]%{$reset_color%}'
local return='%(?..%{$fg[red]%}%? ↲%{$reset_color%})'

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}✭"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""

export PROMPT="╭─${user}${host}:${dir} ${ruby_ver} ${git_branch}
╰─${prompt_char} "
export RPROMPT="${return} ${time}"
export PROMPT2="(%_):-${prompt_char}"
