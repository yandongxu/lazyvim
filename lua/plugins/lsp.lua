return {
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "emmet-language-server",
        "vue-language-server",
        "stylelint-lsp",
        "docker-compose-language-service", -- Docker compose
        "dockerfile-language-server", -- Docker
        "json-lsp", -- JSON

        "stylua", -- Lua LSP
        "shellcheck", -- Shell
        "shfmt", -- Shell
      },
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    -- NOTE 使用 `eslint-plugin-pretter` 使用 `eslint` 修复错误，使用 `prettier` 格式化代码
    opts = {
      servers = {
        eslint = {},
        -- Stylelint
        stylelint_lsp = {
          settings = {
            stylelintplus = {
              autoFixOnFormat = true,
              autoFixOnSave = true,
            },
          },
          filetypes = {
            "css",
            "less",
            "scss",
            "sugarss",
            "vue",
            "wxss",
          },
        },
        -- JSON
        jsonls = {
          init_options = {
            provideFormatter = false,
          },
          filetypes = { "json", "jsonc" },
        },
      },
      setup = {
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
