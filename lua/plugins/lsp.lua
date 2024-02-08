return {
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "stylelint-lsp", -- Stylelint
        "vue-language-server", -- Volar
        "emmet-language-server", -- Emmet
        "css-lsp", -- CSS
        "cssmodules-language-server", -- CSS module
        "prisma-language-server", -- Prisma
        "graphql-language-service-cli", -- GraphQL
        "astro-language-server", -- Astro

        "stylua", -- Lua LSP
        "shellcheck", -- Shell
        "shfmt", -- Shell

        "markdownlint", -- Markdown
        "marksman",
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      servers = {
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_language_server
        emmet_language_server = {
          filetypes = {
            "html",
            "htmldjango",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "css",
            "less",
            "sass",
            "scss",
          },
        },
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
        eslint = {
          settings = {
            -- format = false,
          },
        },
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#stylelint_lsp
        stylelint_lsp = {
          settings = {
            stylelintplus = {
              autoFixOnFormat = true,
              autoFixOnSave = true,
            },
          },
          filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" },
        },
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
        volar = {
          filetypes = { "javascriptreact", "typescriptreact", "vue" },
        },
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#prismals
        prismals = {},
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#graphql
        graphql = {},
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
        cssls = {
          css = {
            validate = true,
            -- lint = {
            --   unknownAtRules = "ignore",
            --   unknownProperties = "ignore",
            -- },
          },
          less = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
        -- @doc https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssmodules_ls
        cssmodules_ls = {},
      },
      setup = {
        -- NOTE 使用 `eslint-plugin-pretter` 使用 `eslint` 修复错误，使用 `prettier` 格式化代码
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  --
  -- TODO: 使用 `Emmet LS` 替代 `Emmet language server`, 解决 JSX className 问题
  -- # Emmet language server
  -- (Emmet language server)[https://github.com/olrtg/emmet-language-server?tab=readme-ov-file]
  -- # Emmet LS
  -- (Emmet LS)[https://github.com/aca/emmet-ls]
  -- (Emmet config)[https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267]
  -- {
  --   "neovim/nvim-lspconfig",
  -- },
}
