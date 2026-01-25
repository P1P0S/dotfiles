return {
  {
    "P1P0S/nvim-packagereader",
    config = function()
      require("packagereader").setup {
        package_manager = "npm", -- Default package manager
        alternate_managers = { "yarn", "pnpm", "bun" }, -- List of alternate managers
        auto_detect_manager = true, -- Auto-detect based on lock files
        show_notifications = true, -- Show notifications when running scripts

        execution = {
          method = "terminal", -- terminal, split, vsplit, tab, async
          terminal_size = 15,
          focus_terminal = true,
          close_on_sucess = false,
        },

        window = {
          width = 80, -- Width of the floating window
          height = 20, -- Height of the floating window
          border = "rounded", -- Border style for the window
          title = "Package Scripts", -- Window title
          title_pos = "center", -- Title position (left/center/right)
        },

        keymaps = {
          run = "<CR>", -- Key to run the selected script
          close = { "q", "<Esc>" }, -- Keys to close the window
          refresh = "r", -- Key to refresh the script list
        },

        highlight = {
          selected = "Visual", -- Highlight for selected script
          title = "Title", -- Highlight for window title
          border = "FloatBorder", -- Highlight for window border
        },
      }
    end,
  },
}
