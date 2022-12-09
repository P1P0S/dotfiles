local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    mode = "buffers",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    color_icons = true
  },
}

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
