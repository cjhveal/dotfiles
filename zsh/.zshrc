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

zplug "kcrawford/dockutil", use:"scripts/dockutil", as:command, if:"[[ $OSTYPE == *darwin* ]]"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

export PATH="$PATH:$HOME/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.local-zshrc ] && source ~/.local-zshrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/codyveal/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/codyveal/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
