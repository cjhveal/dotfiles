function! CustomTabularPatterns()
  if exists('g:tabular_loaded')
    AddTabularPattern! symbols         / :/l0
    AddTabularPattern! hash            /^[^>]*\zs=>/
    AddTabularPattern! chunks          / \S\+/l0
    AddTabularPattern! assignment      / = /l0
    AddTabularPattern! comma           /^[^,]*,/l1
    AddTabularPattern! colon           /:\zs /l0
    AddTabularPattern! options_hashes  /:\w\+ =>/
  endif
endfunction

autocmd VimEnter * call CustomTabularPatterns()

" shortcut to align text with Tabular
map <Leader>a<space> :Tabularize<space>
map <Leader>a/ :Tabularize<space>/
map <Leader>as :Tabularize<space>symbols
map <Leader>ah :Tabularize<space>hash
map <Leader>ac :Tabularize<space>chunks
map <Leader>ao :Tabularize<space>options_hashes
