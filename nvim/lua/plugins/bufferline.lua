return {
  "akinsho/nvim-bufferline.lua",
  config = function()
    require("bufferline").setup({
      highlights = {
        buffer_selected = {
          fg = "#cdd6f4",
        },
      },
      options = {
        mode = "buffers",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        color_icons = true,
        middle_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- groups
        groups = {
          options = {
            toggle_hidden_on_enter = true,
          },
          items = {
            {
              name = "Tests", -- Mandatory
              matcher = function(buf) -- Mandatory
                return buf.filename:match("%_test") or buf.filename:match("%_spec")
              end,
            },
            {
              name = "Docs",
              auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
              matcher = function(buf)
                return buf.filename:match("%.md") or buf.filename:match("%.txt")
              end,
            },
          },
        },

        -- numbers
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
      },
    })

    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
  end,
  lazy = true,
  event = require("utils.lazy_loading").bufferline,
}
