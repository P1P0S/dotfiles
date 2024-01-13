return {
  "0x100101/lab.nvim",
  config = function()
    require("lab").setup {
      code_runner = { enabled = true },
      quick_data = { enabled = false },
    }
  end,
  build = "cd && npm ci",
  event = "VeryLazy",
}
