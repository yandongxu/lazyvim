return {
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "emmet-language-server",
        "vue-language-server",
        "stylelint-lsp",
        "stylua", -- Lua LSP
        "shellcheck", -- Shell
        "shfmt", -- Shell
      },
    },
  },
}
