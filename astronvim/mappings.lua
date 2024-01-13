local keymap = vim.keymap
local sections = {
  L = { desc = " Lab" },
}

local opts = { noremap = true, silent = true }

return {
  -- Which key
  n = {
    ["<leader>te"] = { "<cmd>TermExec direction='horizontal' size=10 cmd='node %'<cr>", desc = "Exec current js" },
    ["j"] = false,
    ["k"] = false,
    ["<leader>ue"] = {
      function() require("notify").dismiss { silent = true, pending = true } end,
      desc = "Delete all Notifications",
    },
    ["<leader>L"] = sections.L,
    ["<leader>Lr"] = { "<cmd>Lab code run<cr>", desc = "Lab code run" },
    ["<leader>Ls"] = { "<cmd>Lab code stop<cr>", desc = "Lab code stop" },
    ["<leader>Lp"] = { "<cmd>Lab code panel<cr>", desc = "Lab code panel" },
    ["<leader>Lc"] = { "<cmd>Lab code config<cr>", desc = "Lab code config" },

    ["<leader>pr"] = { "<cmd>PackageReader<cr>", desc = "PackageReader JSON" },

    ["<F11>"] = {
      function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
    },

    ["<C-'>"] = { "<cmd>ToggleTerm direction=horizontal size=10<cr>" },
  },
  t = {
    ["<C-'>"] = { "<cmd>ToggleTerm direction=horizontal size=10<cr>" },
  },

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
  --keymap.set("n", "<C-u>", "<C-u>zz"), -- Scroll and place in the middle
  --keymap.set("n", "<C-p>", "<C-d>zz"),

  keymap.set("n", "<Tab>", ":bn<CR>", opts),
  keymap.set("n", "<S-Tab>", ":bp<CR>", opts),

  keymap.set("t", "<C-n>", "<C-\\><C-n>", opts),
}
