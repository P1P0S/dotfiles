local M = {}

local override = require "custom.override"

M.ui = {
  theme_toggle = { "nightfox", "ayu-dark" },
  theme = "nightfox",

  tabufline = {
    lazyload = false,
  },
}

M.plugins = {
   user = require "custom.plugins",

   override = {
      ["lewis6991/gitsigns.nvim"] = override.gitsigns,
      ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

M.options = {
   user = function ()
      require "custom.options"
   end
}

M.mappings = require "custom.configs.mappings"

return M
