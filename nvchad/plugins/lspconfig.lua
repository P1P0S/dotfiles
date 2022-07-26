local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd", "jsonls", "eslint", "tsserver", "emmet_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = attach,
    capabilities = capabilities,
    root_dir = vim.loop.cwd,
  }
end

-- temporarily disable tsserver suggestions
require("custom.configs.tsserver")

