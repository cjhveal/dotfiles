set nocompatible

" Plugins
" =======
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'

" file tree
Plug 'scrooloose/nerdtree'

" undo tree
Plug 'mbbill/undotree'

" tpope <3
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'wokalski/autocomplete-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" formatting
Plug 'sbdchd/neoformat'
Plug 'godlygeek/tabular'

" syntax
Plug 'sheerun/vim-polyglot'

" colorschemes
Plug 'tomasr/molokai'

call plug#end()

" General Config
" ==============
set encoding=utf-8              " Display unicode
set number                      " Line numbers are good
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set backspace=indent,eol,start  " Allow backspace in insert mode
set mouse=vin                   " Allow cursor in visual, normal, insert modes
set laststatus=2                " Always show status line
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set noerrorbells                " Disable error bells
set spelllang=en_us             " Spelling correction
set shortmess=I                 " Don't show intro information
set nofoldenable                " Don't fold by default
set autoread                    " Reload files changed outside vim
set nowrap                      " Don't wrap lines
set visualbell                  " Don't beep
set ruler                       " Show row,col of cursor

" enable filetype plugins
if has('autocmd')
  filetype plugin indent on
endif

if has("persistent_undo")
    set undodir=~/.config/nvim/.undodir
    set undofile
endif

" Completion
" ==========
set wildmode=list:longest
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*.jpg,*.png,*.xpm,*.gif,*.pdf

" Indentation and Display
" =======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set shiftround
set softtabstop=2
set tabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" show cursor line for current window in normal mode
set cursorline
augroup cline
    au!
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" Start scrolling when we're getting close to margins
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup

" Search Settings
" ===============
set incsearch        " Find the next match as we type the search
set hlsearch         " Hilight searches by default
set ignorecase       " Ignore case ...
set smartcase        " Unless search contains a capital letter
set viminfo='100,f1  " Save up to 100 marks, enable capital marks


" Syntax Highlighting
" ===================
syntax on
syntax enable
set t_Co=256 " ?
set background=dark
let g:molokai_original = 1
colorscheme molokai

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Filetype Config
" ===============

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell wrap linebreak nolist


" Key Mappings
" ============

" Glorious leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"


" Y should behave like C and D
nnoremap Y y$

" Command Line
" ------------

" :W should behave like :w
cnoreabbrev W w
" Save file with sudo permissions
cnoremap w!! w !sudo tee % >/dev/null
" return current opened file's dirctory
cnoremap %% <C-R>=expand('%:h').'/'<CR>


" Window/Split Management
" -----------------------

" Move around splits with ctrl+direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Split window in direction
nmap \|h  :topleft  vnew<CR>
nmap \|l :botright vnew<CR>
nmap \|k    :topleft  new<CR>
nmap \|j  :botright new<CR>
" Split buffer in direction
nmap \h  :leftabove  vnew<CR>
nmap \l :rightbelow vnew<CR>
nmap \k    :leftabove  new<CR>
nmap \j  :rightbelow new<CR>

" Searching
" ---------

" Keep searches in the middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv

" Toggle spelling
nnoremap <Leader>ss :setlocal spell!<CR>
" n: next, p: previous, a: add, ?: suggest
nnoremap <Leader>sn ]s
nnoremap <Leader>sp ]p
nnoremap <Leader>sa zg
nnoremap <Leader>s? z=

" Swap ' and ` because ` is more useful:
" ` jumps to row & col of mark
" ' jumps only to row of mark
nnoremap ' `
nnoremap ` '


" Plugin Settings
" ===============

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" (Super)Tab
let g:SuperTabClosePreviewOnPopupClose = 1
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"

" Neoformat

let g:neoformat_only_msg_on_error = 1

let g:neoformat_javascript_myprettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--single-quote',
           \ '--trailing-comma es5',
           \ '--print-width 100',
           \ '--stdin'],
  \  'stdin': 1,
  \ }

let g:neoformat_enabled_javascript = ['myprettier']

function! ToggleAutoFormat()
  if !exists('#jsfmt#BufWritePre')
    augroup jsfmt
      autocmd!
      autocmd BufWritePre *.js,*.jsx,*.js.flow Neoformat
    augroup END
  else
    augroup jsfmt
      autocmd!
  endif
endfunction

" call ToggleAutoFormat()

nnoremap <Leader>tf :call ToggleAutoFormat()<CR>

" pangloss/vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" mxw/vim-jsx
let g:jsx_ext_required = 0

" vim-json
let g:vim_json_syntax_conceal = 0

" fzf
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Search open buffers
nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Search current directory
nnoremap <Leader>f :FZF<CR>

" set launcher to open in terminal
let g:fzf_launcher = "in_a_new_term_function %s"

nnoremap <silent> <Leader>m :call fzf#run({
\   'source': 'sed "1d" $HOME/.cache/neomru/file',
\   'sink': 'e '
\ })<CR>
