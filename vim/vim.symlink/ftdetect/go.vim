autocmd BufRead,BufNewFile *.go setlocal noexpandtab

autocmd FileType go nmap <Leader>gs <Plug>(go-implements)
autocmd FileType go nmap <Leader>ge <Plug>(go-rename)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
