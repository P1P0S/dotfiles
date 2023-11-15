return {
  { "sainnhe/everforest" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup {
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      }
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function() end,
  },
  {
    "luisiacc/gruvbox-baby",
    config = function() end,
  },
  {
    "dasupradyumna/midnight.nvim",
    config = function() end,
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
    "akai54/2077.nvim",
  },
}
