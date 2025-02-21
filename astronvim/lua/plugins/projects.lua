return {
  "Rics-Dev/project-explorer.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    paths = { "~/dev/" },
    command_pattern = "find %s -mindepth %d -maxdepth %d -type d -not -name '.git'",
    newProjectPath = "~/dev/",
    file_explorer = function(dir)
      vim.cmd "Neotree close"
      vim.cmd("Neotree " .. dir)
    end,
  },
  config = function(_, opts) require("project_explorer").setup(opts) end,
  cond = function() return vim.g.neovide end,
}
