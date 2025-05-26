return {
  "monkoose/neocodeium",
  event = "User AstroFile",
  cmd = "NeoCodeium",
  dependencies = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Neocodeium = "󱚟",
        },
      },
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astroui.status"

        -- Add NeoCodeium status component to the statusline
        table.insert(
          opts.statusline,
          10,
          status.component.builder {
            {
              provider = function()
                -- Ensure the neocodeium module exists before trying to access it
                local ok, neocodeium = pcall(require, "neocodeium")
                if not ok then return status.utils.stylize("󰚩", { padding = { right = 1 } }) end

                local aistatus, serverstatus = neocodeium.get_status()
                return status.utils.stylize(
                  (aistatus ~= 0 and (aistatus == 1 and "󱚧" or "󱙻")) or (serverstatus == 0 and "󰚩" or "󱚢"),
                  { padding = { right = 1 } }
                )
              end,
            },
            hl = { fg = "fg" },
            update = {
              "BufEnter",
              callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
            },
            init = function(self)
              -- Properly setup event listeners for NeoCodeium status changes
              if type(status.init.update_events) == "function" then
                status.init.update_events {
                  {
                    "User",
                    pattern = { "NeoCodeiumServer*", "NeoCodeium*Enabled", "NeoCodeium*Disabled" },
                    callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
                  },
                }(self)
              else
                -- Fallback if update_events is not a function
                vim.api.nvim_create_autocmd("User", {
                  pattern = { "NeoCodeiumServer*", "NeoCodeium*Enabled", "NeoCodeium*Disabled" },
                  callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
                })
              end
            end,
            surround = {
              separator = "right",
              color = "section_bg",
              condition = function()
                local enabled = vim.g.neocodeium_enabled
                if enabled ~= false and vim.b.neocodeium_enabled ~= nil then enabled = vim.b.neocodeium_enabled end
                return enabled ~= false -- Make sure it returns true when enabled is nil or true
              end,
            },
          }
        )
      end,
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          mappings = {
            n = {
              ["<Leader>;"] = {
                desc = require("astroui").get_icon("Neocodeium", 1, true) .. "NeoCodeium",
              },
              ["<Leader>;o"] = {
                desc = "Open Chat",
                function() vim.cmd "NeoCodeium chat" end,
              },
              ["<Leader>;d"] = {
                desc = "Disable NeoCodeium",
                function()
                  vim.cmd "NeoCodeium disable"
                  vim.notify("NeoCodeium disabled", vim.log.levels.INFO)
                end,
              },
              ["<Leader>;e"] = {
                desc = "Enable NeoCodeium",
                function()
                  vim.cmd "NeoCodeium enable"
                  vim.notify("NeoCodeium enabled", vim.log.levels.INFO)
                end,
              },
              ["<Leader>;t"] = {
                desc = "Toggle NeoCodeium",
                function()
                  local enabled = vim.g.neocodeium_enabled
                  if enabled ~= false then
                    vim.cmd "NeoCodeium disable"
                    vim.notify("NeoCodeium disabled", vim.log.levels.INFO)
                  else
                    vim.cmd "NeoCodeium enable"
                    vim.notify("NeoCodeium enabled", vim.log.levels.INFO)
                  end
                end,
              },
              ["<Leader>;s"] = {
                desc = "Status NeoCodeium",
                function()
                  local ok, neocodeium = pcall(require, "neocodeium")
                  if not ok then
                    vim.notify("NeoCodeium not found", vim.log.levels.ERROR)
                    return
                  end

                  local serverstatus = neocodeium.get_status()
                  local status_text = "unknown"

                  if serverstatus == 0 then status_text = "Server offline" end

                  vim.notify("NeoCodeium status: " .. status_text, vim.log.levels.INFO)
                end,
              },
            },
          },
        })
      end,
    },
  },

  config = function()
    local neocodeium = require "neocodeium"
    neocodeium.setup {
      enabled = true,
      bin = nil,
      manual = false,
      server = {
        api_url = nil,
        portal_url = nil,
      },
      show_label = true,
      debounce = false,
      max_lines = 10000,
      silent = false,
      disable_in_special_buftypes = true,
      log_level = "warn",
      single_line = {
        enabled = false,
        label = "...",
      },
      filter = function(bufnr)
        if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".env") then return false end
        return true
      end,
      filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
      },
      root_dir = { ".bzr", ".git", ".hg", ".svn", "_FOSSIL_", "package.json" },
    }

    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-w>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-a>", neocodeium.accept_line)
    vim.keymap.set("i", "<A-e>", function() neocodeium.cycle_or_complete() end)
    vim.keymap.set("i", "<A-n>", function() neocodeium.cycle_or_complete(-1) end)
    vim.keymap.set("i", "<A-c>", neocodeium.clear)
  end,
}
