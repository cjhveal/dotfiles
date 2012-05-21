# My Dotfiles
This repository contains my personal configurations.

### INSTALL INSTRUCTIONS
1. Run rake to install
  <code>rake</code>

2. Change shell to zsh
  <code>chsh -s $(which zsh)</code>

3. Install all vim plugins
  <code>git submodule update --init</code>

4. <code>open ~/.dotfiles/fonts</code> and install all fonts

### TODO
* OS X
  * add osx config script (map caps to escape, finder settings, etc)
  * add terminal colorscheme
* Meta
  * default packages list (brews/gems)
  * do a deep dive of dotfiles on github
  * bootstrap script (set shell to zsh, etc)
* Vim
  * mvim should not use system pastebin (confirm?)
  * fix vim colorscheme (modified solarize? tomorrow-night?)
  * canabalize old vim-rc for any missed behaviours
  * vim autocomplete function
  * Pull apart vimrc functionality into plugins/settings files
  * Fix command to reload vimrc (,vr broken?)
  * What is paste mode?
  * when I quit it should close the buffer not just window
* ZSH
  * zsh completions and learn about zsh functions
  * what is zvm? what is fasd?
* Ruby
  * Look into wirble as an optional irb enhancement
  * automatically detect and configure rbenv/rvm
  * what is prefer for gem inclusion?
  * gemrc file
  * use pp for printing if ap not installed
* Git
  * Give full names to all aliases, shortcuts in .zsh
  * hitch for pair programming
  * gitattributes?
* Install
  * information on how to install this repo
  * split modules of the dotfiles into rake tasks (eg. zsh, vim, ruby)
* Other
  * irssi config (cloudhead)
  * toprc ?!
