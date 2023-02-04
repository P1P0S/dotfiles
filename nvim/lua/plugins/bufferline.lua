return {
  "akinsho/nvim-bufferline.lua",
  config = function()
    require("bufferline").setup({
      highlights = {
        buffer_selected = {
          fg = "#cdd6f4",
          --bg = "",
        },
      },
      options = {
        mode = "buffers",
        separator_style = "thin",
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        color_icons = true,
        middle_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    })

    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
  end,
  lazy = true,
  event = require("utils.lazy_loading").bufferline
}
