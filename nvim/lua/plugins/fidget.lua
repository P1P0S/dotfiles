return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      text = {
        spinner = "moon", -- animation shown when tasks are ongoing
        done = "✔", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
    })
  end,
}
