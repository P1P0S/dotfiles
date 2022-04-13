vim.opt.list = true
vim.opt.listchars:append("eol:↴")

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
	enabled = true,
	bufname_exclude = { "README.md" },
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"alpha",
		"log",
		"gitcommit",
		"dapui_scopes",
		"dapui_stacks",
		"dapui_watches",
		"dapui_breakpoints",
		"dapui_hover",
		"LuaTree",
		"dbui",
		"UltestSummary",
		"UltestOutput",
		"vimwiki",
		"markdown",
		"json",
		"txt",
		"vista",
		"NvimTree",
		"git",
		"TelescopePrompt",
		"undotree",
		"flutterToolsOutline",
		"org",
		"orgagenda",
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Outline",
		"Trouble",
		"lspinfo",
		"", -- for all buffers without a file type
	},
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	}
}
