return {
  "vyfor/cord.nvim",
  opts = {
    text = {
      workspace = function() return "" end,
    },
    editor = {
      client = "neovim",
      tooltip = "I swear this is productive",
    },
  },
  build = ":Cord update",
}
