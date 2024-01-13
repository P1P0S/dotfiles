return {
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup {
        transparent_background = false,
      }
    end,
  },
  {
    "LunarVim/synthwave84.nvim",
    config = function()
      require("synthwave84").setup {
        glow = {
          error_msg = true,
          type2 = true,
          func = true,
          keyword = true,
          operator = false,
          buffer_current_target = true,
          buffer_visible_target = true,
          buffer_inactive_target = true,
        },
      }
    end,
  },
  { "oni0002/neg.vim" },
  { "folke/tokyonight.nvim" },
  { "neanias/everforest-nvim" },
}
