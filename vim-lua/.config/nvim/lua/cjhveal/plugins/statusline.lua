
local icons = require('cjhveal.config').icons

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
        'branch',
        {
          'diff',
          symbols = {
            added    = icons.git.added,
            modified = icons.git.modified,
            removed  = icons.git.removed,
          },
        },
      },
      lualine_x = {
        {
          'diagnostics',
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        'lsp_status',
      },
      lualine_y = { 'filetype' },
      lualine_z = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
    },
    inactive_sections = {
      lualine_c = {
        -- show relative path
        { "filename", path = 1},
      },
    }
  },
}


--[[
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
]]
