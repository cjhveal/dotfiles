let g:ctrlp_custom_ignore = '\.DS_Store|\.git$\|\.hg$\|\.svn$'

let g:ctrlp_by_filename = 1
let g:ctrlp_map = ',p'

nnoremap ,b :CtrlPBuffer<CR>
nnoremap <C-b> :CtrlPBuffer<CR>

nnoremap <silent> <D-P> :ClearCtrlPCache<CR>

map <leader>fm :CtrlP app/models<CR>
map <leader>fc :CtrlP app/controllers<CR>
map <leader>fv :CtrlP app/views<CR>
map <leader>fh :CtrlP app/helpers<CR>
map <leader>fa :CtrlP app/assets<CR>
map <leader>fl :CtrlP lib<CR>
map <leader>fs :CtrlP spec<CR>
map <leader>fC :CtrlP config<CR>
