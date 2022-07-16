local opt = vim.opt

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 3
opt.ruler = false
opt.shiftwidth = 2
opt.tabstop = 2

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.cmd("au BufNewFile,BufRead *.norg set nolist")
