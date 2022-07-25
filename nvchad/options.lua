local opt = vim.opt
local g = vim.g

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 3
opt.ruler = false
opt.shiftwidth = 2
opt.tabstop = 2
opt.foldenable = false

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.guifont = "FiraCode NF"
vim.cmd("au BufNewFile,BufRead *.norg set nolist")

--neovide
g.neovide_cursor_vfx_mode = "railgun"
g.neovide_cursor_vfx_particle_lifetime = 2.0
g.neovide_cursor_vfx_particle_density = 7.0
g.neovide_fullscreen = true
g.neovide_remember_window_size = true

