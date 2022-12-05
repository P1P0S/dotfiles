-- vim.opt = set
-- vim.g = let
local keymap = vim.keymap
vim.g.mapleader = '<Space>'

keymap.set('n', 'x', '"_x') -- Not yank to clipboard

keymap.set('n', 'db', 'vb"_d') -- Delete a word backwards

keymap.set('n', '<C-a>', 'gg<S-v>G') -- Select all

keymap.set('n', '<C-s>', ':w<Return>') -- Save

keymap.set('n', 'te', ':tabedit ') -- New tab

-- Split window
keymap.set('n', '<Space>sh', ':split<Return><C-w>w')
keymap.set('n', '<Space>sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('', '<Space>h', '<C-w>h')
keymap.set('', '<Space>j', '<C-w>j')
keymap.set('', '<Space>k', '<C-w>k')
keymap.set('', '<Space>l', '<C-w>l')

-- Resize window
keymap.set('n', '<Space><left>', '<C-w><')
keymap.set('n', '<Space><right>', '<C-w>>')
keymap.set('n', '<Space><up>', '<C-w>+')
keymap.set('n', '<Space><down>', '<C-w>-')
