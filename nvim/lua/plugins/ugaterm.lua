return {
  "uga-rosa/ugaterm.nvim",
  config = function()
    require("ugaterm").setup({
      ---@type string The terminal buffer name prefix.
      prefix = "ugaterm",
      ---@type string The filetype for a terminal buffer.
      filetype = "ugaterm",

      open_cmd = function()
        local height = vim.api.nvim_get_option("lines")
        local width = vim.api.nvim_get_option("columns")
        local win_id = vim.api.nvim_open_win(0, true, {
          relative = "editor",
          border = "single",
          zindex = 10,
          row = math.floor(height * 0.1),
          col = math.floor(width * 0.1),
          height = math.floor(height * 0.8),
          width = math.floor(width * 0.8),
        })
        vim.api.nvim_win_set_option(win_id, "number", false)
      end,
    })
  end,
}
