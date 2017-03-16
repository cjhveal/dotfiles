
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function prompt_git_information() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$STATUS${vcs_info_msg_0_}"
}

function prompt_character {
  if [[ -z $KEYMAP ]]; then
    echo '>'
  fi
  echo "${${KEYMAP/vicmd/○}/(main|viins)/>}"
}

local user='%(!.$PR_RED.$PR_GREEN)%n%{$reset_color%}'
local host=''
if [[ -n $SSH_CONNECTION ]]; then
  host='@$PR_YELLOW%m%{$reset_color%}'
fi
local dir='$PR_BLUE${PWD/#$HOME/~}%{$reset_color%}'
local git_branch='$(prompt_git_information)'
local prompt_char='$(prompt_character)'

local time='${PR_CYAN}[%D{%Kh%M %a %f/%-m}]%{$reset_color%}'

local return='%(?..$PR_RED%? ↲%{$reset_color%})'

ZSH_THEME_GIT_PROMPT_AHEAD="$PR_YELLOW⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="$PR_GREEN✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="$PR_BLUE✹"
ZSH_THEME_GIT_PROMPT_DELETED="$PR_RED✖"
ZSH_THEME_GIT_PROMPT_RENAMED="$PR_MAGENTA➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="$PR_YELLOW═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$PR_CYAN✭"

export PROMPT="╭─${user}${host}:${dir} ${git_branch}
╰─${prompt_char} "
export RPROMPT="${return} ${time}"
export PROMPT2="(%_):-${prompt_char}"
