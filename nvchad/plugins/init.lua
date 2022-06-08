return {
     ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },

   ["editorconfig/editorconfig-vim"] = {
     disable = false,
   },
}
