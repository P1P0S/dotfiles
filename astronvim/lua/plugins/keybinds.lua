local set = vim.keymap.set
local opts = { noremap = true, silent = true }

return {
  -- Normal bind
  set("n", "<A-q>", ":wq<CR>", opts),
  set("n", "x", '"_x'), -- Not yank to clipboard
  set("n", "db", 'vb"_d'), -- Delete a word backwards
  set("n", "<C-a>", "gg<S-v>G"), -- Select all
  set("n", "<C-s>", ":w<Return>", opts), -- Save
  set("n", "te", ":tabedit "), -- New tab
  set("n", "<C-x>", ":bdelete<CR>", opts),

  set("v", "J", ":m '>+1<CR>gv=gv"),
  set("v", "K", ":m '<-2<CR>gv=gv"),
  set("n", "<C-u>", "<C-u>zz"), -- Scroll and place in the middle
  set("n", "<C-d>", "<C-d>zz"),

  set("n", "tn", ":tabnext<CR>", opts), -- default is gt
  set("n", "tp", ":tabprevious<CR>", opts), -- default is g S-t
  set("n", "<Tab>", ":bn<CR>", opts),
  set("n", "<S-Tab>", ":bp<CR>", opts),

  set("t", "<C-n>", "<C-\\><C-n>", opts), -- Leave terminal mode
}
