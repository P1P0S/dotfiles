local keymap = vim.keymap
local sections = {
  L = { desc = " Lab" },
  W = { desc = "󰝘 Window" },
}

local opts = { noremap = true, silent = true }

return {
  -- Which key
  n = {
    ["j"] = false,
    ["k"] = false,
    ["<leader>o"] = false,
    ["<leader>lD"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble Diagnostics" },
    -- ["<leader>fp"] = { "<cmd>Telescope file_browser<cr>", desc = "Open file browser" },
    -- ["<leader>e"] = { "<cmd>Telescope file_browser<cr>", desc = "Open file browser" },
    ["<leader>te"] = { "<cmd>TermExec direction='horizontal' size=10 cmd='node %'<cr>", desc = "Exec current js" },
    ["<leader>ue"] = {
      function() require("notify").dismiss { silent = true, pending = true } end,
      desc = "Delete all Notifications",
    },
    ["<leader>L"] = sections.L,
    ["<leader>Lr"] = { "<cmd>Lab code run<cr>", desc = "Lab code run" },
    ["<leader>Ls"] = { "<cmd>Lab code stop<cr>", desc = "Lab code stop" },
    ["<leader>Lp"] = { "<cmd>Lab code panel<cr>", desc = "Lab code panel" },
    ["<leader>Lc"] = { "<cmd>Lab code config<cr>", desc = "Lab code config" },

    ["<leader>W"] = sections.W,
    ["<leader>Wt"] = { "<cmd>FocusToggle<cr>", desc = "Toggle Focus" },
    ["<leader>Ww"] = { "<cmd>FocusToggleWindow<cr>", desc = "Focus Toggle on Window" },
    ["<leader>Wb"] = { "<cmd>FocusToggleBuffer<cr>", desc = "Focus Toggle on Buffer" },
    ["<leader>Wm"] = { "<cmd>FocusMaximise<cr>", desc = "Focus Maximise" },
    ["<leader>Wa"] = { "<cmd>FocusAutoresize<cr>", desc = "Focus Auto Resize" },
    ["<leader>We"] = { "<cmd>FocusEqualise<cr>", desc = "Focus Equalise" },

    ["<leader>pr"] = { "<cmd>PackageReader<cr>", desc = "PackageReader JSON" },

    ["<F11>"] = {
      function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
    },

    ["<C-'>"] = { "<cmd>ToggleTerm direction=horizontal size=10<cr>" },

    ["<leader>fy"] = { "<cmd>Telescope yank_history<cr>", desc = "Yank History" },
  },
  t = {
    ["<C-'>"] = { "<cmd>ToggleTermToggleAll<cr>" },
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
  keymap.set("n", "<C-u>", "<C-u>zz"), -- Scroll and place in the middle
  keymap.set("n", "<C-d>", "<C-d>zz"),

  -- keymap.set("n", "tn", ":tabnext<CR>", opts), -- default is gt
  -- keymap.set("n", "tp", ":tabprevious<CR>", opts), -- default is g S-t
  keymap.set("n", "<Tab>", ":bn<CR>", opts),
  keymap.set("n", "<S-Tab>", ":bp<CR>", opts),

  keymap.set("t", "<C-n>", "<C-\\><C-n>", opts), -- Leave terminal mode
}
