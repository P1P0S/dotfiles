local telescope = require("telescope")
local wk = require("which-key")

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

-- local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
})

-- telescope.load_extension("file_browser")

wk.register({
	t = {
		name = "Telescope",
		f = {
			function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end,
			"Find File",
		},
		b = {
			function()
				builtin.buffers()
			end,
			"Show Buffers",
		},
		h = {
			function()
				builtin.help_tags()
			end,
			"Help Tags",
		},
		r = {
			function()
				builtin.resume()
			end,
			"Resume",
		},
		d = {
			function()
				builtin.diagnostics()
			end,
			"Diagnostics",
		},
	},
}, opts)
