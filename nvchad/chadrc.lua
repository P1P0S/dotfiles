local M = {}

M.ui = {
  theme_toggle = { "nightfox", "ayu-dark" },
  theme = "nightfox",

  tabufline = {
    lazyload = false,
  },
}

M.plugins = {
  user = require "custom.plugins",

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

M.mappings = require("custom.configs.mappings")


return M
