return {
  {
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
    },
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
}
