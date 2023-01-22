local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier.with({
    prefer_local = "node_modules\\.bin",
    command = "prettier.cmd",
  }),
  formatting.stylua,
  diagnostics.eslint_d.with({
    diagnostics_format = "[eslint] #{m}\n(#{c})",
  }),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

null_ls.setup({
  sources = sources,
  debug = true,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          --vim.lsp.buf.formatting_sync()
          -- vim 0.8
          vim.lsp.buf.format({ timeout_ms = 2000 })
        end,
      })
    end
  end,
})
