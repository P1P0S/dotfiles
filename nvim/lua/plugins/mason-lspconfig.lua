return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = require("utils.lists").install_lspservers,
      automatic_installation = true,
    })
  end,
}
