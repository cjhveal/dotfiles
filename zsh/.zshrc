# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "~/.zsh/setopt.zsh", from:local
zplug "~/.zsh/bindkeys.zsh", from:local
zplug "~/.zsh/history.zsh", from:local
zplug "~/.zsh/colors.zsh", from:local
zplug "~/.zsh/bindkeys.zsh", from:local
zplug "~/.zsh/aliases.zsh", from:local
zplug "~/.zsh/exports.zsh", from:local
zplug "~/.zsh/prompt.zsh", from:local

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
