return {
  "b0o/incline.nvim",
  config = function()
    local helpers = require "incline.helpers"
    require("incline").setup {
      window = {
        padding = 0,
        margin = { horizontal = 1 },
      },
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified and "bold,italic" or "bold"
        local modified_indicator = vim.bo[props.buf].modified and " " or ""
        local modified_color = vim.bo[props.buf].modified and "#cc6600" or nil
        local buffer = {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = modified },
          " ",
          { modified_indicator, guifg = modified_color },
          guibg = "#44406e",
        }
        return buffer
      end,
    }
  end,
  event = "BufReadPre",
}
