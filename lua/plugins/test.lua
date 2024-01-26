return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
    },
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true },
      adapters = {
        {
          ["neotest-vitest"] = {},

          ["neotest-playwright"] = {
            option = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          },
        },
      },
    },
  },
}
