return {
  -- == Overriding Plugins ==
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {}
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sources = cmp.config.sources {
        { name = "codeium", priority = 10000 },
        { name = "nvim_lsp", priority = 1000 },
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
    "nvim-tree/nvim-web-devicons",
    opts = function(_, opts)
      opts = {
        override_by_extension = {
          ["typescriptreact"] = {
            icon = "󰜈",
            name = "typescriptreact",
          },
        },
        override_by_filename = {
          ["router.tsx"] = {
            icon = "󰑪",
            name = "router",
            color = "#385C30",
          },
        },
      }
      return opts
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.winbar = {
        condition = function() return status.condition.is_active() end,
        status.component.separated_path {
          path_func = status.provider.filename { modify = ":.:h" },
        },
        -- add the file name and icon
        status.component.file_info {
          file_icon = {
            hl = status.hl.file_icon "winbar",
            padding = { left = 0 },
          },
          filename = {},
          filetype = false,
          file_modified = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbarnc", true),
          surround = false,
          update = "BufEnter",
        },
      }
    end,
  },
  {
    "goolord/alpha-nvim",
    cond = function() return not vim.g.neovide end,
  },
  {
    "folke/which-key.nvim",
    -- classic | morden | helix
    opts = function(_, opts) opts.preset = "helix" end,
  },
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts) opts.background_colour = "#000000" end,
  },
}
