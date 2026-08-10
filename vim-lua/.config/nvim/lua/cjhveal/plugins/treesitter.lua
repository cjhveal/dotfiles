local languages = {
  "bash",
  "c",
  "diff",
  "git_config",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "gitattributes",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "json5",
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
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false, -- main does not support lazy-loading
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()
    require('nvim-treesitter').install(languages)

    -- no jsonc parser on `main`
    vim.treesitter.language.register('json', 'jsonc')

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('cjhveal_treesitter', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then
          return
        end

        -- `get_lang` falls back to the filetype name, and `add` returns nil rather
        -- than raising, so a missing parser only shows up in `add`'s return value
        local ok, loaded = pcall(vim.treesitter.language.add, lang)
        if not ok or not loaded then
          return
        end

        vim.treesitter.start(args.buf, lang)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
