let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' }
let g:AutoCloseProtectedRegions = ["Character"]

if !has("gui_running")
   let g:AutoClosePreservDotReg = 0
endif
