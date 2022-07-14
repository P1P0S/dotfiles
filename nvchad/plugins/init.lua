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

  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.configs.alpha"
    end
  },

  ["andweeb/presence.nvim"] = {
    disable = false,
    config = function()
      require "custom.configs.presence"
    end
  },
}
