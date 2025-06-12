# Dotfiles

My MacOS software configurations, as well as scripts and systems to bootstrap setup on a new machine.


### Installation

The `bootstrap.sh` script will install all configurations and software packages.

You can run the following to get started:

```
git clone https://github.com/cjhveal/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./bootstrap.sh
```

The bootstrap script does the following:
    1. install Homebrew, 
    2. install software from the .Brewfile
    3. install GNU Stow
    4. Use `stow` to symlink the contents of `brew`, `zsh`, and `vim` folders
    5. Set default shell to `zsh`
    6. Configure macOS system `defaults` with `macos.sh` script.


### Zsh

An incomplete list of customizations:
- Vi keybindings at prompt
- Autocompletion from zsh-users
- History substring search completion
- Custom prompt including: git status, node version, virtualenv, vi mode, date/time.


### Vim

Neovim configurations are currently being rewritten, see `vim-lua` folder. Feature parity is roughly complete with a few missing items.

plugins to add:
`mini.surround` for changing wrapping characters
`nvim-tree` file explorer
`which-key` for key suggestion

#### Keybinds

| keybind | effect |
| ------- | ------ |
| `<Space>` | Glorious `<Leader>` |
| `<leader>f` | fuzzy find files |


etc.
