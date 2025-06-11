-- General Config
-- ==============

-- line numbers
vim.opt.number = true
-- sign column
vim.opt.signcolumn = "yes"
-- don't make noise on errors
vim.opt.visualbell = true
vim.opt.errorbells = false
-- show line,col
vim.opt.ruler = true

-- Backups
-- =======

-- don't use swapfile or backups
vim.opt.swapfile = false
vim.opt.backup = false

-- use undofiles
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- after 50ms without input, assume i'm done typing
vim.opt.updatetime = 50


-- Indentation and Display
-- =======================
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- display a line for cursor
vim.opt.cursorline = true
-- turn off cursorline during insert mode or when leaving buffer
local cline_group = vim.api.nvim_create_augroup('cline', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter', 'InsertLeave' }, {
  pattern = '*',
  group = cline_group,
  command = 'set cursorline',
})
vim.api.nvim_create_autocmd({ 'WinLeave', 'InsertEnter' }, {
  pattern = '*',
  group = cline_group,
  command = 'set nocursorline',
})

-- don't wrap lines
vim.opt.wrap = false
-- don't fold my code
vim.opt.foldenable = false

-- start scrolling when we're close to margins
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.sidescroll = 1


-- Search Settings
-- ===============
vim.opt.hlsearch = true   -- highlight searches by default
vim.opt.incsearch = true  -- find next match as we type
vim.opt.ignorecase = true -- Ignore capitalization...
vim.opt.smartcase = true  -- Unless search contains capital letter
