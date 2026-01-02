return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
          icons = {
            Laravel = "",
          },
        },
      },
    },
    event = "VeryLazy",
    config = function()
      require("laravel").setup {
        features = {
          pickers = { provider = "snacks" },
        },
      }
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local icon = require("astroui").get_icon("Laravel", 1, true) .. "Laravel"

      return require("astrocore").extend_tbl(opts, {
        mappings = {
          n = {
            ["<leader>L"] = { desc = icon },

            ["<leader>Ll"] = {
              desc = "Laravel: Open Laravel Picker",
              function() Laravel.pickers.laravel() end,
            },

            ["<C-g>"] = {
              desc = "Laravel: View Finder",
              function() Laravel.commands.run "view:finder" end,
            },

            ["<leader>La"] = {
              desc = "Laravel: Artisan Picker",
              function() Laravel.pickers.artisan() end,
            },

            ["<leader>Lt"] = {
              desc = "Laravel: Actions Picker",
              function() Laravel.commands.run "actions" end,
            },

            ["<leader>Lr"] = {
              desc = "Laravel: Routes Picker",
              function() Laravel.pickers.routes() end,
            },

            ["<leader>Lh"] = {
              desc = "Laravel: Documentation",
              function() Laravel.run "artisan docs" end,
            },

            ["<leader>Lm"] = {
              desc = "Laravel: Make Picker",
              function() Laravel.pickers.make() end,
            },

            ["<leader>Lc"] = {
              desc = "Laravel: Commands Picker",
              function() Laravel.pickers.commands() end,
            },

            ["<leader>Lo"] = {
              desc = "Laravel: Resources Picker",
              function() Laravel.pickers.resources() end,
            },

            ["<leader>Lp"] = {
              desc = "Laravel: Command Center",
              function() Laravel.commands.run "command_center" end,
            },

            ["gf"] = {
              desc = "Laravel: Smart gf",
              expr = true,
              noremap = true,
              function()
                local ok, res = pcall(function()
                  if Laravel.app("gf").cursorOnResource() then return "<cmd>lua Laravel.commands.run('gf')<cr>" end
                end)
                if not ok or not res then return "gf" end
                return res
              end,
            },
          },
        },
      })
    end,
  },
}
