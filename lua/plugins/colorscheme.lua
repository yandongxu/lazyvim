return {
  -- { "LunarVim/lunar.nvim" }, Lunar
  -- { "projekt0n/github-nvim-theme", }, Github
  -- { "scottmckendry/cyberdream.nvim" }, -- Cyberdream

  -- {
  --   "LazyVim/LazyVim",
  --   colorscheme = "lunar",
  --   opts = {},
  -- },

  -- Tokyonight theme config
  -- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        -- floats = "transparent", -- 浮动窗口半透明
      },
    },
  },
}
