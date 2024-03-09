return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items = {
        visible = false,
        hide_gitignored = false,
        hide_hidden = true,
      }
      return opts
    end,
    -- enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "codeium", priority = 800 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }
      return opts
    end,
  },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- Add icon on lspkind
      opts.symbol_map = vim.tbl_extend("force", opts.symbol_map, {
        Codeium = "",
      })
      return opts
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = {
        layout_strategy = "horizontal",
        layout_config = { horizontal = { prompt_position = "bottom" } },
      }
      opts.pickers = {
        colorscheme = {
          enable_preview = true,
        },
      }
    end,
    -- dependencies = { { "nvim-telescope/telescope-file-browser.nvim", cmd = "Telescope file_browser" } },
  },
  {
    "max397574/better-escape.nvim",
    enabled = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = function(_, opts)
      opts.user_default_options = {
        tailwind = true,
      }
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    enabled = false,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local getWeekday = require "user.utils.weekday"
      opts.section.header.val = {
        " |\\__/,|   (`\\ ",
        " |_ _  |.--.) )  ",
        " ( T   )     /   ",
        "(((^_(((/(((_/   ",
        "   " .. getWeekday(),
      }
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = function(_, opts)
      opts.nav = {
        preview = true,
      }
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {},
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.builder {
          { provider = "" },
          surround = { separator = "left", color = { main = "bg", right = "file_info_bg" } },
        },
        status.component.git_branch(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }
      return opts
    end,
  },
}
