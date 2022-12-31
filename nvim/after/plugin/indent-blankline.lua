vim.opt.list = true

require("indent_blankline").setup({
  show_current_context = false,
  show_current_context_start = false,
  filetype_exclude = {
    "help",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
})
