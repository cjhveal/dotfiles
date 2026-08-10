-- @TODO: Attach keybinds and configure capabilities

local Config = require('cjhveal.config');
local LspUtils = require('cjhveal.utils.lsp');

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = Config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = Config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = Config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = Config.icons.diagnostics.Info,
          }
        },
      },
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      servers = {
        -- Typescript/React
        -- ****************
        vtsls = {
          -- explicitly add default filetypes, so that we can extend
          -- them in related extras
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          keys = {
            {
              "gD",
              function()
                local params = vim.lsp.util.make_position_params()
                LspUtils.execute({
                  command = "typescript.goToSourceDefinition",
                  arguments = { params.textDocument.uri, params.position },
                  open = true,
                })
              end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              function()
                LspUtils.execute({
                  command = "typescript.findAllFileReferences",
                  arguments = { vim.uri_from_bufnr(0) },
                  open = true,
                })
              end,
              desc = "File References",
            },
            {
              "<leader>co",
              LspUtils.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              LspUtils.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              LspUtils.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
            {
              "<leader>cD",
              LspUtils.action["source.fixAll.ts"],
              desc = "Fix all diagnostics",
            },
          },
        },

        -- Lua
        -- ***
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
      setup = {
        -- custom setup per server here
        -- return `true` if running lspconfig `setup` here
      },
    },
    config = function(_, opts)
      local keymap_handler = require('cjhveal.plugins.lsp.keymap').handle_attach
      LspUtils.on_attach(keymap_handler)

      LspUtils.setup()

      LspUtils.on_dynamic_capability(keymap_handler)



      -- diagnostics signs
      if type(opts.diagnostics.signs) ~= "boolean" then
        for severity, icon in pairs(opts.diagnostics.signs.text) do
          local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
          name = "DiagnosticSign" .. name
          vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
        end
      end

      if opts.inlay_hints.enabled then
        LspUtils.on_supports_method("textDocument/inlayHint", function(_, buffer)
          if
            vim.api.nvim_buf_is_valid(buffer)
            and vim.bo[buffer].buftype == ""
            and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
          then
            vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
          end
        end)
      end

      --[[ CODE LENS
      if opts.codelens.enabled and vim.lsp.codelens then
        LspUtils.on_supports_method("textDocument/codeLens", function(_, buffer)
          vim.lsp.codelens.refresh()
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = buffer,
            callback = vim.lsp.codelens.refresh,
          })
        end)
      end
      ]]--

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
          or function(diagnostic)
            local icons = Config.icons.diagnostics
            for d, icon in pairs(icons) do
              if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                return icon
              end
            end
          end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_blink and blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )


      local servers = opts.servers
      local enable = {} ---@type string[]
      for server, base_opts in pairs(servers) do
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, base_opts or {})

        if server_opts.enabled == false then
          vim.lsp.enable(server, false)
          goto continue
        end
        if opts.setup[server] and opts.setup[server](server, server_opts) then
          goto continue
        end

        -- `keys` and `enabled` are ours, not part of vim.lsp.Config
        server_opts.keys = nil
        server_opts.enabled = nil

        vim.lsp.config(server, server_opts)
        table.insert(enable, server)

        ::continue::
      end
      vim.lsp.enable(enable)
    end
  },
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      -- @TODO: Automatically install these with mason
      ensure_installed = {
        "eslint_d",
        "hadolint",

        "stylua",
        "prettierd",
        "rustywind",
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jsonls",
        "lua_ls",
        "marksman",
        "tailwindcss",
        "taplo",
        "vtsls",
        "yamlls",
        "zk",
      },
    },
    dependencies = {
      {"mason-org/mason.nvim", opts={}},
      "neovim/nvim-lspconfig",
    },
  },
}
