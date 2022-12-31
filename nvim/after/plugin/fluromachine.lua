local g = vim.g
g.fluoromachine_italic_comments = false
g.fluoromachine_italic_functions = false
g.fluoromachine_italic_keywords = false
g.fluoromachine_italic_variables = false

require("fluoromachine").setup({
  transparent = true,
  glow = false,
  brightness = 0.05,
})
