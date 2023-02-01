return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local wk = require("which-key")

    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "git" },
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    })

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
        w = {
          function()
            builtin.live_grep()
          end,
          "Find Word",
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
        c = {
          function()
            builtin.colorscheme()
          end,
          "Colorscheme",
        },
      },
    }, opts)
  end,
  tag = "0.1.1",
  dependencies = "nvim-lua/plenary.nvim",
}
