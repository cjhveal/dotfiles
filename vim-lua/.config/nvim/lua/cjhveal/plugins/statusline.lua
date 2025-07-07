return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = 'powerline',
      extensions = {'fzf', 'man', 'mason', 'neo-tree', 'trouble'},
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        -- show relative path
        { "filename", path = 1},
      },
      lualine_c = {
        'branch', 'diff',
      },
      lualine_x = { 'diagnostics', 'lsp_status', },
      lualine_y = { 'filetype' },
      lualine_z = { 'progress', },
    },
    inactive_sections = {
      lualine_c = {
        -- show relative path
        { "filename", path = 1},
      },
    }
  },
}
