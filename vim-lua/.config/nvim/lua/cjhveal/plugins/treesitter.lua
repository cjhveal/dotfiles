return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'master',
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = { enable = true },
    sync_install = true,
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
  config = function (_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end
}
