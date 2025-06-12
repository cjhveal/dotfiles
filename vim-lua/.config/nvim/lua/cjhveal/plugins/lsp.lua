return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
          "lua_ls",
          "jsonls",
          "tailwindcss",
          "vtsls",
        },
    },
    dependencies = {
      {"mason-org/mason.nvim", opts={}},
      "neovim/nvim-lspconfig",
    },
  },
}
