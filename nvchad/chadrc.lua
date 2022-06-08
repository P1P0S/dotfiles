local M = {}

M.ui = {
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   user = require "custom.plugins"

}

return M
