-- vim.opt = set
-- vim.g = let
local opt = vim.opt
local g = vim.g
local wo = vim.wo

-- nightfly theme
g.nightflyCursorColor = true
g.nightflyNormalFloat = true
g.nightflyUnderlineMatchParen = true

vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileformat = "unix"

--vim.wo.number = true
wo.rnu = true
g.mapleader = " "

opt.ruler = true
opt.cursorline = true
opt.mouse = "a"
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = "pwsh"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.nuw = 1
opt.tabstop = 4
opt.wrap = false -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })
opt.clipboard:prepend({ "unnamed", "unnamedplus" })
--opt.guicursor = ""
opt.colorcolumn = "90"
