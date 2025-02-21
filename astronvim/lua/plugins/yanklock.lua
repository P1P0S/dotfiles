return {
  "daltongd/yanklock.nvim",
  config = function()
    require("yanklock").setup {
      notify = true,
    }
  end,
  keys = {
    {
      "<leader>yt",
      function() require("yanklock").toggle() end,
      noremap = true, silent = true, desc = "Toggle yanklock",
    },
  },
}
