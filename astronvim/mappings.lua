local keymap = vim.keymap

return {
  -- Which key
  n = {
    ["<leader>te"] = { "<cmd>TermExec direction='horizontal' size=10 cmd='node %'<cr>", desc = "Exec current js" },
    ["j"] = false,
    ["k"] = false,
  },

  -- Normal bind
  keymap.set("n", "<A-q>", ":wq<CR>", { silent = true }),
  keymap.set("n", "x", '"_x'), -- Not yank to clipboard
  keymap.set("n", "db", 'vb"_d'), -- Delete a word backwards
  keymap.set("n", "<C-a>", "gg<S-v>G"), -- Select all
  keymap.set("n", "<C-s>", ":w<Return>", { silent = true }), -- Save
  keymap.set("n", "te", ":tabedit "), -- New tab
  keymap.set("n", "<C-x>", ":bdelete<CR>", { silent = true }),

  keymap.set("v", "J", ":m '>+1<CR>gv=gv"),
  keymap.set("v", "K", ":m '<-2<CR>gv=gv"),
  keymap.set("n", "J", "mzJ`z"),

  keymap.set("n", "<C-u>", "<C-u>zz"), -- Scroll and place in the middle
  keymap.set("n", "<C-p>", "<C-d>zz"),
}
