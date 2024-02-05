return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- Prettier
      formatters_by_ft = {
        ["lua"] = { "stylua" },
        ["sh"] = { "shfmt" },

        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["html"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },

        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },

        -- ["markdown"] = { "prettier" },
        -- ["markdown.mdx"] = { "prettier" },
      },
    },
  },
}
