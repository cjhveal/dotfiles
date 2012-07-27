" Custom Mappings
" ==============
"
" Arpeggio lets us define key-chord combos (simultaneous key presses)
call arpeggio#load()

" j and k simultaneously exits insert or visual mode
Arpeggio inoremap jk  <Esc>
Arpeggio vnoremap jk  <Esc>

" Y should behave like C and D
nmap Y y$

" :W should behave like :w
cnoreabbrev W w

" allows saving with ;w;
cnoremap w; w<CR>

" save file with sudo permissions
cmap w!! w !sudo tee % >/dev/null

" return current opened file's dirctory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Move around splits with ctrl+direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" clear search highlighting when hitting enter
nnoremap <leader><space> :nohlsearch<CR>

"Go to last edit location with ,.
nnoremap ,. '.

" Change inside quotes with Cmd-" and Cmd-'
nnoremap <D-'> ci'
nnoremap <D-"> ci"

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (e)xecute - execute the current file as vim script
nmap <silent> ,ve :so %<CR>

"(v)im (r)eload - reload vimrc
nmap <silent> ,vr :so $MYVIMRC<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" Hit Cmd-Shift-A then type a character you want to align by
nmap <D-A> :Tabularize /
vmap <D-A> :Tabularize /

" SplitJoin plugin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>


" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

" one-key indentation
nmap > >>
nmap < <<

" reselect selection after indentation
vnoremap > >gv
vnoremap < <gv

" Toggle spelling
nnoremap <Leader>ss :setlocal spell!<CR>
" n: next, p: previous, a: add, ?: suggest
nnoremap <Leader>sn ]s
nnoremap <Leader>sp ]p
nnoremap <Leader>sa zg
nnoremap <Leader>s? z=

" change directory to that of current file
nmap <Leader>cd :cd%:p:h<cr>

" diff buffer with original to see changes
nnoremap <Leader>d :call DiffOrig()<CR>

" split window
nmap \|h  :topleft  vnew<CR>
nmap \|l :botright vnew<CR>
nmap \|k    :topleft  new<CR>
nmap \|j  :botright new<CR>

" split buffer
nmap \h  :leftabove  vnew<CR>
nmap \l :rightbelow vnew<CR>
nmap \k    :leftabove  new<CR>
nmap \j  :rightbelow new<CR>

" alias ; to :
nnoremap ; :
vnoremap ; :

" allow deleting without updating the clipboard (yank buffer)
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" Default searches to "very magic", more like the world outside Vim.
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Move current line down/up
map <C-Down> ]e
map <C-Up> [e

" Move visually selected lines down/up
vmap <C-Down> ]egv
vmap <C-Up> [egv

nnoremap <Leader>tp :set paste!<CR>
nnoremap <Leader>tn :call LineNumbers()<CR>
function! LineNumbers()
  if &nu
    set nonu rnu
  elseif &rnu
    set nonu nornu
  else
    set nornu nu
  endif
endfunction

" Yank entire buffer with gy
nmap gy :%y+<cr>

" C/M/D-d/f moves up/down a page
" think j/k on left hand
nmap <C-d> <C-b>
if has("gui_macvim")
  nmap <D-f> <C-f>
  nmap <D-d> <C-b>
else
  nmap <M-f> <C-f>
  nmap <M-d> <C-b>
endif

" Keep searches in the middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv

" Open a quickfix window with the last search
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" ctags
nnoremap <silent> <leader>ct :!ctags -R *<CR>
nnoremap <leader>rct  :!bundle exec rails runner 'puts $LOAD_PATH.join(" ")' \| xargs /usr/local/bin/ctags -R public/javascripts<CR>
map <leader>t g<C-]>

map <F1> <Esc>
imap <F1> <Esc>

" find help for word under cursor
nnoremap <Leader>h :help <C-R><C-W><CR>

" H and L to jump to start and end of line.
nnoremap H ^
nnoremap L g_
