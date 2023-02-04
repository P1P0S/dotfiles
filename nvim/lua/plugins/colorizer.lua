return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
  lazy = true,
  event = "BufEnter *.css, *.scss"
}
