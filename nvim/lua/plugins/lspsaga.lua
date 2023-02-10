return {
  "glepnir/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
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
        code_action = "",
      },
    })
  end,
}
