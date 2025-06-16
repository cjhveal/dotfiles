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

-- Tab managment
vim.keymap.set("n", "<leader><Tab>n", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader><Tab><Tab>", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader><Tab>]", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader><Tab>[", "<cmd>tabp<CR>")
vim.keymap.set("n", "<leader><Tab>d", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader><Tab>l", "<cmd>tablast<CR>")


-- Keep searches in center of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")
-- keep cursor centered when scrolling half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move selections up or down
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")

-- delete/paste over without changing register
vim.keymap.set({ "n", "x" }, "<leader>d", [["_d]])
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- fix common capitalization typos
vim.keymap.set("ca", "W", "w")
vim.keymap.set("ca", "Q", "q")
vim.keymap.set("ca", "WQ", "wq")
vim.keymap.set("ca", "Wq", "wq")

-- Swap ' and ` because ` is more useful:
-- ` jumps to row & col of mark
-- ' jumps only to row of mark
vim.keymap.set("n", "'", "`")
vim.keymap.set("n", "`", "'")
