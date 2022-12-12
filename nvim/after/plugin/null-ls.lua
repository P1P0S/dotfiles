local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.stylua,
  diagnostics.eslint_d.with({
    diagnostics_format = "[eslint] #{m}\n(#{c})",
  }),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

null_ls.setup({
  sources = sources,
  debug = false,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          --vim.lsp.buf.formatting_sync()
          -- vim 0.8
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
