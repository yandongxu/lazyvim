return {
  ----------------------
  -- User extends config
  ----------------------

  -- Lunar theme
  { "LunarVim/lunar.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lunar",
    },
  },

  -- Lunar theme config
  -- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = {
  --     style = "moon",
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       -- floats = "transparent", -- 浮动窗口半透明
  --     },
  --   },
  -- },

  ----------------------
  -- Lazy default config
  ----------------------

  -- 代码块对称高亮
  -- {
  --   "echasnovski/mini.indentscope",
  --   opts = {
  --     draw = {
  --       -- delay = 10,
  --       animation = function(s, n)
  --         return 5
  --       end,
  --     },
  --   },
  -- },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
         ██╗   ██╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗  ██╗          Z 
         ╚██╗ ██╔╝██╔══██╗████╗  ██║██╔══██╗██╔════╝╚██╗██╔╝      Z     
          ╚████╔╝ ███████║██╔██╗ ██║██║  ██║█████╗   ╚███╔╝    z        
           ╚██╔╝  ██╔══██║██║╚██╗██║██║  ██║██╔══╝   ██╔██╗  z          
            ██║   ██║  ██║██║ ╚████║██████╔╝███████╗██╔╝ ██╗            
            ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝            
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
