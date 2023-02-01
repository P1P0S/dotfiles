return {
  "neovim/nvim-lspconfig",
  config = function()
    Servers = require("utils.lists").lspservers
    local capabilities = require("cmp_nvim_lsp").default_capabilities() -- nvim cmp
    local nvim_lsp = require("lspconfig")
    local on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    for _, lsp in ipairs(Servers) do
      nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      update_in_insert = true,
      float = {
        source = "always",
      },
    })
  end,
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = Servers,
          automatic_installation = true,
        })
      end,
    },
  },
}
