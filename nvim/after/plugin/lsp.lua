local nvim_lsp = require("lspconfig")
local wk = require("which-key")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings
	local opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	--buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	--buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

	wk.register({
		l = {
			name = "LSP",
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Open File Implementation" },
		},
	}, opts)

	-- Disable Autoformat deprecated on 0.8
	--client.resolved_capabilities.document_formatting = false
	--client.resolved_capabilities.document_range_formatting = false
end

local servers = { "tsserver", "sumneko_lua" }

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
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
