---@diagnostic disable: undefined-global
local neovide = require "user.utils.neovide"
local discipline = require "user.utils.discipline"
discipline.cowboy()

local themes = {
  maachiato = "catppuccin-macchiato",
  mocha = "catppuccin-mocha",
  night = "tokyonight-night",
  storm = "tokyonight-storm",
  moon = "tokyonight-moon",
  wave = "kanagawa-wave",
  dragon = "kanagawa-dragon",
  min = "min-theme",
  solar_night = "solarized-osaka-night",
  rose = "rose-pine",
  mirage = "ayu-mirage",
  synthwave84,
  everforest,
  neg,
}

local selected_theme = "ayu"

return {
  colorscheme = themes[selected_theme] or selected_theme,
  neovide,

  icons = {
    VimIcon = "",
    GitBranch = "",
  },
  -- modify variables used by heirline but not defined in the setup call directly
  heirline = {
    -- define the separators between each section
    separators = {
      left = { "", " " }, -- separator for the left side of the statusline
      right = { " ", "" }, -- separator for the right side of the statusline
      tab = { "", "" },
    },
  },
}
