return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        "neotest-vitest",
      },
    },
  },
}
