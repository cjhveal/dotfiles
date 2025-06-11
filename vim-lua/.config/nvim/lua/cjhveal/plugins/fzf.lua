return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    {"<leader><space>", "<cmd>FzfLua files<CR>", desc = "Find Files"},
    {"<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files"},
    {"<leader>fg", "<cmd>FzfLua git_files<CR>", desc = "Find Git Files"},
    {"<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>", desc="Switch Buffer"},

    { '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
    { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    
    { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
    { "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
    { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" }

  }
}
