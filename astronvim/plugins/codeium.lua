return {
  "Exafunction/codeium.nvim",
  event = "VeryLazy",
  cmd = "Codeium",
  opts = {},
  config = function() require("codeium").setup {} end,
}
