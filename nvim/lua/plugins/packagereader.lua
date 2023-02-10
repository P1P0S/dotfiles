return {
  "P1P0S/nvim-packagereader",
  config = function()
    require("nvim-packagereader").setup({
      manager = "yarn"
    })
  end,
  lazy = true,
  cmd = "PackageReader",
}
