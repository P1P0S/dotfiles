return {
  "P1P0S/nvim-packagereader",
  config = function()
    require("nvim-packagereader").setup {
      manager = "npm",
      telescope_mode = "insert",
      terminal_mode = "tab",
    }
  end,
  cmd = "PackageReader",
}
