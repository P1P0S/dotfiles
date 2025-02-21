return {
	"echasnovski/mini.indentscope",
	event = "VeryLazy",
	opts = {
		symbol = "▏",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			---@diagnostic disable-next-line: inject-field
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
