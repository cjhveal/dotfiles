let g:ctrlp_custom_ignore = '\.DS_Store|\.git$\|\.hg$\|\.svn$'

let g:ctrlp_by_filename = 1
let g:ctrlp_map = ',p'

nnoremap ,b :CtrlPBuffer<CR>
nnoremap <C-b> :CtrlPBuffer<CR>

nnoremap <silent> <D-P> :ClearCtrlPCache<CR>

map <leader>rm :CtrlP app/models<CR>
map <leader>rc :CtrlP app/controllers<CR>
map <leader>rv :CtrlP app/views<CR>
map <leader>rh :CtrlP app/helpers<CR>
map <leader>ra :CtrlP app/assets<CR>
map <leader>rl :CtrlP lib<CR>
map <leader>rs :CtrlP spec<CR>
map <leader>rC :CtrlP config<CR>
