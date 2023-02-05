local wk = require("which-key")
local keymap = vim.keymap
local opts = { mode = "n", prefix = "<leader>", noremap = true, silent = true }

-- Pomodoro func
local function pc(func)
  return "<Cmd>lua require('pommodoro-clock')." .. func .. "<CR>"
end

keymap.set("n", "<A-q>", ":wq<CR>")
keymap.set("n", "x", '"_x') -- Not yank to clipboard
keymap.set("n", "db", 'vb"_d') -- Delete a word backwards
keymap.set("n", "<C-a>", "gg<S-v>G") -- Select all
keymap.set("n", "<C-s>", ":w<Return>") -- Save
keymap.set("n", "te", ":tabedit ") -- New tab
keymap.set("n", "<C-x>", ":bdelete<CR>")
-- Move window
keymap.set("", "<C-h>", "<C-w>h")
keymap.set("", "<C-j>", "<C-w>j")
keymap.set("", "<C-k>", "<C-w>k")
keymap.set("", "<C-l>", "<C-w>l")

-- Resize window
keymap.set("n", "<A-left>", "<C-w>>")
keymap.set("n", "<A-right>", "<C-w><")
keymap.set("n", "<A-up>", "<C-w>+")
keymap.set("n", "<A-down>", "<C-w>-")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")

keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll and place in the middle
keymap.set("n", "<C-p>", "<C-d>zz")

wk.register({
  -- Utils
  u = {
    name = "Utils",
    c = { ":set ff=unix<CR>", "Convert File To Unix" },
    t = { ":tabedit", "Tab Edit" },
    n = { ":noh<Return>", "Remove Search Highlight" },
  },

  -- Window
  w = {
    name = "Window",
    h = { ":split<Return><C-w>w", "Split Horizontal" },
    v = { ":vsplit<Return><C-w>w", "Split Vertical" },
  },

  -- LSP
  l = {
    name = "LSP",
    o = { "<Cmd>Lspsaga outline<CR>", "LSP Outline" },
    r = { "<Cmd>Lspsaga rename<CR>", "LSP Rename" },
    j = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "LSP Jump Next Diagnostic" },
    h = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "LSP Jump Prev Diagnostic" },
    l = { "<Cmd>Lspsaga show_line_diagnostics<CR>", "LSP Show Line Diagnostic" },
    b = { "<Cmd>Lspsaga show_buf_diagnostics<CR>", "LSP Show Buf Diagnostic" },
    k = { "<Cmd>Lspsaga hover_doc<CR>", "LSP Hover Doc" },
    f = { "<Cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
    p = { "<Cmd>Lspsaga peek_definition<CR>", "LSP Peek Definition" },
    a = { "<Cmd>Lspsaga code_action<CR>", "LSP Code Action" },
  },

  -- Buffers
  b = {
    name = "Buffers",
    p = { ":BufferLinePick<CR>", "Peeck Buffer" },
    c = { ":BufferLinePickClose<CR>", "Close Buffer" },
    t = { ":BufferLineTogglePin<CR>", "Pin Buffer" },
  },

  -- NvimTree
  e = {
    { ":NvimTreeToggle<Return>", "Open NvimTree" },
  },

  -- Package Reader
  p = {
    ":lua require('packagereader').show_scripts()<CR>",
    "Run PackageReader",
  },

  -- Git
  g = {
    name = "Git",
    h = {
      name = "Hunk",
      n = { ":Gitsigns next_hunk<cr>", "Next Hunk" },
      p = { ":Gitsigns prev_hunk<cr>", "Prev Hunk" },
      g = { ":Gitsigns get_hunks<cr>", "Get Hunks" },
      P = { ":Gitsigns preview_hunk<cr>", "Preview Hunk" },
      r = { ":Gitsigns reset_hunk<cr>", "Reset Hunk" },
      i = { ":Gitsigns preview_hunk_inline<cr>", "Preview Hunk Inline" },
    },
    t = {
      name = "Toggle",
      t = { ":Gitsigns toggle_current_line_blame<cr>", "Toggle Current Line Blame" },
      d = { ":Gitsigns toggle_deleted<cr>", "Toggle Deleted" },
      n = { ":Gitsigns toggle_numhl<cr>", "Toggle Numbers" },
      s = { ":Gitsigns toggle_linehl<cr>", "Toggle Block Scope" },
    },
    b = { ":Gitsigns blame_line<cr>", "Blame Line" },
    d = { ":Gitsigns diffthis<cr>", "Diff" },
  },

  -- Lazy
  L = {
    { "<cmd>Lazy<cr>", "Lazy 💤" },
  },

  -- Telescope
  t = {
    name = "Telescope",
    f = {
      function()
        require("telescope.builtin").find_files({
          no_ignore = false,
          hidden = true,
        })
      end,
      "Find File",
    },
    w = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Find Word",
    },
    b = {
      function()
        require("telescope.builtin").buffers()
      end,
      "Show Buffers",
    },
    h = {
      function()
        require("telescope.builtin").help_tags()
      end,
      "Help Tags",
    },
    r = {
      function()
        require("telescope.builtin").resume()
      end,
      "Resume",
    },
    d = {
      function()
        require("telescope.builtin").diagnostics()
      end,
      "Diagnostics",
    },
    c = {
      function()
        require("telescope.builtin").colorscheme()
      end,
      "Colorscheme",
    },
  },

  -- Format
  f = {
    "<cmd> lua vim.lsp.buf.format({ timeout_ms = 2000 }) <cr>",
    "Format",
  },

  -- Dashboard
  d = {
    "<cmd> Dashboard <cr>",
    "Dashboard",
  },

  -- Pomodoro
  P = {
    name = "Pommodoro",
    w = { pc('start("work")'), "Start Pommodoro" },
    s = { pc('start("short_break")'), "Short Break" },
    l = { pc('start("long_break")'), "Long Break" },
    p = { pc("toggle_pause()"), "Toggle Pause" },
    c = { pc("close()"), "Close" },
  },
}, opts)
