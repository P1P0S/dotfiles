local status, lspsaga = pcall(require, "lspsaga")
if not status then
  return
end

lspsaga.setup({
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    in_select = true,
  },
  ui = {
    -- currently only round theme
    theme = "round",
    -- border type can be single,double,rounded,solid,shadow.
    border = "rounded",
    winblend = 5,
    code_action = "💡",
    colors = {
      --float window normal bakcground color
      normal_bg = "#002b36",
      --title background color
      title_bg = "#afd700",
      red = "#e95678",
      magenta = "#b33076",
      orange = "#FF8700",
      yellow = "#f7bb3b",
      green = "#afd700",
      cyan = "#36d0e0",
      blue = "#61afef",
      purple = "#CBA6F7",
      white = "#d1d4cf",
      black = "#1c1c19",
    },
  },
})
