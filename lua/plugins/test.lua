return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- Basic dependencies
      -- https://www.youtube.com/watch?v=O6jJacmBCwY
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",

      -- Other adapters
      -- "haydenmeade/neotest-jest",
      -- "nvim-neotest/neotest-jest",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        -- require("neotest-jest"),
        require("neotest-vitest"),
        -- FIXME: Playwright 未能正常运行
        -- TODO: https://github.com/microsoft/playwright/issues/11060
        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),
      })
      -- Vitest
      -- https://www.youtube.com/watch?v=7Nt8n3rjfDY
      -- table.insert(opts.adapters, require("neotest-vitest"))

      -- Playwright
      -- https://github.com/alpha2phi/neovim-pde/blob/05-web/lua/pde/typescript.lua
    end,
  },
}
