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
  synthwave84,
  everforest,
  neg,
}

local selected_theme = "everforest"

return {
  colorscheme = themes[selected_theme] or selected_theme,
  neovide,
}
