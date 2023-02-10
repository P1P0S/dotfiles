return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
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
  end,
  lazy = true,
  -- cmd = "Telescope find_files",
  cmd = require("utils.lazy_loading").telescope_cmds,
  tag = "0.1.1",
  dependencies = "nvim-lua/plenary.nvim",
}
