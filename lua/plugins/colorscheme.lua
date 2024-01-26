return {
  -- Lunar theme
  { "LunarVim/lunar.nvim" },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --   },
  --     colorscheme = "lunar",
  -- },

  -- Tokyonight theme config
  -- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      -- style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        -- floats = "transparent", -- 浮动窗口半透明
      },
    },
  },
}
