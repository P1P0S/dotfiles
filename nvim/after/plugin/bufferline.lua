vim.opt.termguicolors = true
require("bufferline").setup({
  highlights = {
    buffer_selected = {
      fg = "#80a0ff",
      --bg = "",
    },
  },
  options = {
    mode = "buffers",
    separator_style = "thick",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    color_icons = true,
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
