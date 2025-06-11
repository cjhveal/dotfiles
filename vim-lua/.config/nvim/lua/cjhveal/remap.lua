-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Y should behave like C and D
vim.keymap.set("n", "Y", "y$")

-- Split window in direction
vim.keymap.set("n", "|h", "<cmd>topleft  vnew<CR>")
vim.keymap.set("n", "|l", "<cmd>botright vnew<CR>")
vim.keymap.set("n", "|k", "<cmd>topleft  new<CR>")
vim.keymap.set("n", "|j", "<cmd>botright new<CR>")
-- Split buffer in direction
vim.keymap.set("n", "\\h", "<cmd>leftabove  vnew<CR>")
vim.keymap.set("n", "\\l", "<cmd>rightbelow vnew<CR>")
vim.keymap.set("n", "\\k",   "<cmd>leftabove  new<CR>")
vim.keymap.set("n", "\\j",  "<cmd>rightbelow new<CR>")

-- Keep searches in center of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")

