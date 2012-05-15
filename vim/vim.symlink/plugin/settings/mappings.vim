" Custom Mappings
" ==============
"
" Arpeggio lets us define key-chord combos (simultaneous key presses)
call arpeggio#load()

" Shift space exits insert mode (mvim only)
inoremap <S-Space> <esc>

" j and k simultaneously exits insert mode.
Arpeggio inoremap jk  <Esc>

" Y should behave like C and D
nmap Y y$

" :W should behave like :w
cnoreabbrev W w

" Move around splits with ctrl+direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" clear search highlighting when hitting enter
nnoremap <CR> :nohlsearch<CR>

"Go to last edit location with ,.
nnoremap ,. '.

" Change inside quotes with Cmd-" and Cmd-'
nnoremap <D-'> ci'
nnoremap <D-"> ci"

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

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

" Surround plugin shortcuts
" =========================
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

" Toggle spelling
nnoremap <Leader>ss :setlocal spell!<CR>
" n: next, p: previous, a: add, ?: suggest
nnoremap <Leader>sn ]s
nnoremap <Leader>sp ]p
nnoremap <Leader>sa zg
nnoremap <Leader>s? z=
