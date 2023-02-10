---@diagnostic disable: undefined-global
-- vim.opt = set
-- vim.g = let
vim.cmd([[set shellquote= shellxquote=]])
local opt = vim.opt
local g = vim.g
local wo = vim.wo
opt.guifont = "VictorMono Nerd Font"

-- nightfly theme
g.nightflyCursorColor = true
g.nightflyNormalFloat = true
g.nightflyUnderlineMatchParen = true
opt.termguicolors = true
vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileformat = "unix"
opt.fileformats = "unix,dos"

vim.wo.number = true
wo.rnu = true
g.mapleader = " "

opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.ruler = true
opt.mouse = "a"
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.shortmess:append({ c = true, F = true, W = true, I = true })
opt.laststatus = 3
opt.expandtab = true
opt.scrolloff = 10
opt.shell = "pwsh"
opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
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
opt.colorcolumn = "90"
