return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = 'powerline',
      extensions = {'fzf', 'man', 'mason', 'neo-tree', 'trouble'},
    },
    sections = {
      lualine_c = {
        { "filename", path = 1},
      },
    },
    inactive_sections = {
      lualine_c = {
        { "filename", path = 1},
      },
    }
  },
}
