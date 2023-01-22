local status, blankline = pcall(require, "indent_blankline")
if not status then
  return
end
--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")

blankline.setup({
  --space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {
    "help",
    "packer",
    "dashboard",
    "nvim-tree",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
})
