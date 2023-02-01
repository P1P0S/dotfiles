return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "fade",
      timeout = 1000,
      render = "default",
    })
    vim.notify = require("notify")
  end,
  keys = {
    {
      "<leader>nd",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Delete all Notifications",
    },
  },
  init = function()
    vim.notify = function(...)
      require("lazy").load({ plugins = { "nvim-notify" } })
      vim.notify(...)
    end
  end,
}
