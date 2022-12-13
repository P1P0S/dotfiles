local wk = require("which-key")
local keymap = vim.keymap
local opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

keymap.set("n", "x", '"_x') -- Not yank to clipboard
keymap.set("n", "db", 'vb"_d') -- Delete a word backwards
keymap.set("n", "<C-a>", "gg<S-v>G") -- Select all
keymap.set("n", "<C-s>", ":w<Return>") -- Save
keymap.set("n", "te", ":tabedit ") -- New tab

-- Move window
keymap.set("", "<C-h>", "<C-w>h")
keymap.set("", "<C-j>", "<C-w>j")
keymap.set("", "<C-k>", "<C-w>k")
keymap.set("", "<C-l>", "<C-w>l")

-- Resize window
keymap.set("n", "<A-left>", "<C-w>>")
keymap.set("n", "<A-right>", "<C-w><")
keymap.set("n", "<A-up>", "<C-w>+")
keymap.set("n", "<A-down>", "<C-w>-")

-- Wich-key map menu
wk.register({
	u = {
		name = "Utils",
		c = { ":set ff=unix<CR>", "Convert File To Unix" },
		t = { ":tabedit", "Tab Edit" },
		n = { ":noh<Return>", "Remove Search Highlight" },
	},
	w = {
		name = "Window",
		h = { ":split<Return><C-w>w", "Split Horizontal" },
		v = { ":vsplit<Return><C-w>w", "Split Vertical" },
	},
	l = {
		name = "LSP",
		r = { "<Cmd>Lspsaga rename<CR>", "LSP Rename" },
		j = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "LSP Jump Next Diagnostic" },
		k = { "<Cmd>Lspsaga hover_doc<CR>", "LSP Hover Doc" },
		f = { "<Cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
		h = { "<Cmd>Lspsaga signature_help<CR>", "LSP Signature Help" },
		p = { "<Cmd>Lspsaga peek_definition<CR>", "LSP Peek Definition" },
		a = { "<Cmd>Lspsaga code_action<CR>", "LSP Code Action" },
	},
	b = {
		name = "Buffers",
		p = { ":BufferLinePick<Return>", "Peeck Buffer" },
		c = { ":BufferLinePickClose<Return>", "Peeck Buffer Close" },
	},
	e = {
		{ ":NvimTreeToggle<Return>", "Open NvimTree" },
	},
}, opts)
