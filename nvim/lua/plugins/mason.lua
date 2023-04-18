return {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
  end,
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      config = function()
        require("mason-null-ls").setup({
          ensure_installed = require("utils.lists").null_ls_fixers,
        })
      end,
    },
  },
}
