# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

source ~/.zsh/setopt.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/history.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/zsh_hooks.zsh
source ~/.zsh/prompt.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "kcrawford/dockutil", use:"scripts/dockutil", if:"[[ $OSTYPE == *darwin* ]]"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load
