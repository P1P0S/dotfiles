local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

vim.opt.termguicolors = true
bufferline.setup({
  highlights = {
    buffer_selected = {
      fg = "#cdd6f4",
      --bg = "",
    },
  },
  options = {
    mode = "buffers",
    separator_style = "thin",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    color_icons = true,
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
