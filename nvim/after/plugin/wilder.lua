local wilder = require("wilder")

wilder.setup({
  modes = { ":", "/", "?" },
  next_key = "<Tab>",
  previous_key = "<S-Tab>",
  accept_key = "<C-e>",
  reject_key = "<C-w>",
})

local gradient = {
  "#f4468f",
  "#fd4a85",
  "#ff507a",
  "#ff566f",
  "#ff5e63",
  "#ff6658",
  "#ff704e",
  "#ff7a45",
  "#ff843d",
  "#ff9036",
  "#f89b31",
  "#efa72f",
  "#e6b32e",
  "#dcbe30",
  "#d2c934",
  "#c8d43a",
  "#bfde43",
  "#b6e84e",
  "#aff05b",
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
end

wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
    highlighter = wilder.highlighter_with_gradient({
      wilder.basic_highlighter(),
    }),
    --highlights = { border = "normal" },
    highlights = {
      gradient = gradient,
    },
    border = "rounded",
    prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
    --min_width = "75%",
    --min_height = "50%",
    max_right = "0",
    reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    left = { " ", wilder.popupmenu_devicons() },
    right = { " ", wilder.popupmenu_scrollbar() },
    pumblend = 20,
  }))
)
