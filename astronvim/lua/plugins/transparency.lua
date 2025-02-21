return {
  "xiyaowong/transparent.nvim",
  cmd = { "TransparentToggle", "TransparentEnable", "TransparentDisable" },
  config = function() require("transparent").setup() end,
}
