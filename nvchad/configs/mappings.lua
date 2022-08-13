-- custom.mappings
local M = {}

-- Disable mappings
M.disabled = {
  -- remove all lsp keybinds (duplicated)
  n = {
    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "   floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["d]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "   diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.formatting()
      end,
      "   lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
    },

    -- Whichkey mappings
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "   which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "   which-key query lookup",
    },
    -- tabufline
    ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    ["<TAB>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
    ["<S-Tab>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },

    -- cycle through tabs
    ["<leader>tp"] = { "<cmd> tabprevious <CR>", "  goto next tab" },
    ["<leader>tn"] = { "<cmd> tabnext <CR> ", "  goto prev tab" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },

    -- Blankline
    ["<leader>bc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
        vim.g.indent_blankline_context_patterns,
        vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "  Jump to current_context",
    },

    -- Telescope terminal
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- General
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },
  },
}

-- Whichkey Revamped
M.whichkey = {
  n = {
    ["<leader>Wa"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "   which-key all keymaps",
    },
    ["<leader>Wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "   which-key query lookup",
    },
  },
}

M.tabufline = {
  n = {
    -- new buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    ["<TAB>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
    ["<S-Tab>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },

    -- cycle through tabs
    ["<leader>bp"] = { "<cmd> tabprevious <CR>", "  goto next tab" },
    ["<leader>bn"] = { "<cmd> tabnext <CR> ", "  goto prev tab" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },
  },
}

M.blankline = {
  n = {
    ["<leader>cb"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
        vim.g.indent_blankline_context_patterns,
        vim.g.indent_blankline_use_treesitter_scope
        )
        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,
      "  Jump to current_context",
    },
  },
}

M.telescope = {
  n = {
    -- git
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>bt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },

    -- show maps
    ["<leader>Wk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
  },
}

-- Organizing groups correctly
M.groups = {
  n = {
    ["<leader>"] = {
      c = { name = "Code Action" },
      b = { name = "Buffers" },
      f = { name = "Telescope" },
      w = { name = "Workspaces" },
      W = { name = "Mappings" },
      g = { name = "Git" },
      t = { name = "Themes" },
      u = { name = "Update" }
    },
  },
}

return M
