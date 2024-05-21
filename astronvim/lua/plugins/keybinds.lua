local keymap = vim.keymap
local opts = { noremap = true, silent = true }

return {
  -- Normal bind
  keymap.set("n", "<A-q>", ":wq<CR>", opts),
  keymap.set("n", "x", '"_x'), -- Not yank to clipboard
  keymap.set("n", "db", 'vb"_d'), -- Delete a word backwards
  keymap.set("n", "<C-a>", "gg<S-v>G"), -- Select all
  keymap.set("n", "<C-s>", ":w<Return>", opts), -- Save
  keymap.set("n", "te", ":tabedit "), -- New tab
  keymap.set("n", "<C-x>", ":bdelete<CR>", opts),

  keymap.set("v", "J", ":m '>+1<CR>gv=gv"),
  keymap.set("v", "K", ":m '<-2<CR>gv=gv"),
  keymap.set("n", "<C-u>", "<C-u>zz"), -- Scroll and place in the middle
  keymap.set("n", "<C-d>", "<C-d>zz"),

  -- keymap.set("n", "tn", ":tabnext<CR>", opts), -- default is gt
  -- keymap.set("n", "tp", ":tabprevious<CR>", opts), -- default is g S-t
  keymap.set("n", "<Tab>", ":bn<CR>", opts),
  keymap.set("n", "<S-Tab>", ":bp<CR>", opts),

  keymap.set("t", "<C-n>", "<C-\\><C-n>", opts), -- Leave terminal mode
}
