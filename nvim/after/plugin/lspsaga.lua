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
  },
})
