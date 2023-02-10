return {
  "jackMort/pommodoro-clock.nvim",
  config = function()
    require("pommodoro-clock").setup({
      animation_duration = 100,
      sound = "none"
    })
  end,
  lazy = true,
  cmd = "Pommodoro"
}
