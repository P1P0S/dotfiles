return {
  "nvim-lualine/lualine.nvim",
  config = function()
      -- Eviline config for lualine
      -- Author: shadmansaleh
      -- Credit: glepnir
      -- Color table for highlights
-- stylua: ignore
local colors = {
  --bg       = '#202328',
  --bg       = '#1d3b53',
  bg_fluro = '#343852',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  --magenta  = '#ae81ff',
  blue     = '#51afef',
  red      = '#ec5f67',
}
    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg_fluro } },
          inactive = { c = { fg = colors.fg, bg = colors.bg_fluro } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "█ ", "▇ ", "▆ ", "▅ ", "▄ ", "▃ ", "▂ ", "_ ", "▁ " }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end,
      color = { fg = colors.blue },
      padding = { left = 0 },
    })

    ins_left({
      -- mode component
      function()
        return ""
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    })

    ins_left({
      -- filesize component
      --"filesize",
      --cond = conditions.buffer_not_empty,
      "hostname",
      color = { gui = "bold" },
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.magenta, gui = "bold" },
    })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
      function()
        return "%="
      end,
    })

    ins_left({
      function()
        return require("utils.clock").get_current_time()
      end,
    })

    ins_right({
      -- Lsp and null-ls server name
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        local lsp_clients = {}
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if client.name ~= "null-ls" and vim.tbl_contains(filetypes, buf_ft) then
            table.insert(lsp_clients, client.name)
          end
        end
        if next(lsp_clients) == nil then
          return msg
        else
          return table.concat(lsp_clients, ", ")
        end
      end,
      icon = " ",
      color = { fg = "#e2d18a", gui = "bold" },
    })

    -- Add components to right sections
    ins_right({
      "o:encoding", -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "branch",
      icon = "",
      color = { fg = colors.violet, gui = "bold" },
    })

    ins_right({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = " ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_right({
      "progress",
      color = { fg = colors.fg, gui = "bold" },
    })

    ins_right({
      function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "▁", "_", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end,
      color = { fg = colors.blue },
      padding = { left = 1 },
    })
    require("lualine").setup(config)
  end,
}
