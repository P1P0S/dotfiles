local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local with_root_file = function(...)
    local files = { ... }
    return function(utils)
        return utils.root_has_file(files)
    end
end

local sources = {
   -- webdev stuff
   b.formatting.prettier,

   -- Lua
   b.formatting.stylua.with({
      condition = with_root_file("stylua.toml")
   }),

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- cpp
   b.formatting.clang_format,
}


local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

null_ls.setup {
   debug = true,
   sources = sources,

   on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
         vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
               -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
               vim.lsp.buf.formatting_sync()
            end,
         })
      end
   end,
}
