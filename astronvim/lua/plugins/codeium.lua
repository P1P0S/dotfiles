return {
	"Exafunction/codeium.nvim",
	cmd = "Codeium",
	opts = {},
	config = function()
		require("codeium").setup({})
	end,
	event = "BufEnter",
}
