local nvim_lsp = require("lspconfig")
local wk = require("which-key")

local on_attach = function()
  -- Mappings
  local opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

  wk.register({
    l = {
      name = "LSP",
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Open File Implementation" },
    },
  }, opts)
end

local servers = { "tsserver", "sumneko_lua", "html" }
local capabilities = require("cmp_nvim_lsp").default_capabilities() -- nvim cmp

for _, lsp in ipairs(servers) do
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
