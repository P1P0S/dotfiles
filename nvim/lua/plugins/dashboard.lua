return {
  "glepnir/dashboard-nvim",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {

        header = {
          "",
          " ██▓███    ██▓ ██▓███   ▒█████    ██████ ",
          "▓██░  ██ ▒▓██▒▓██░  ██ ▒██▒  ██▒▒██    ▒ ",
          "▓██░ ██▓▒▒▒██▒▓██░ ██▓▒▒██░  ██▒░ ▓██▄   ",
          "▒██▄█▓▒ ▒░░██░▒██▄█▓▒ ▒▒██   ██░  ▒   ██▒",
          "▒██▒ ░  ░░░██░▒██▒ ░  ░░ ████▓▒░▒██████▒▒",
          "▒▓▒░ ░  ░ ░▓  ▒▓▒░ ░  ░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░",
          "░▒ ░     ░ ▒ ░░▒ ░       ░ ▒ ▒░ ░ ░▒  ░ ░",
          "░░       ░ ▒ ░░░       ░ ░ ░ ▒  ░  ░  ░  ",
          "           ░               ░ ░        ░  ",
          "",
        },

        week_header = {
          enable = true,
        },
        disable_move = true,
        shortcut = {
          {
            desc = " Update",
            group = "@property",
            action = "Lazy update",
            key = "u",
          },
          {
            desc = " Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Apps",
            group = "DiagnosticHint",
            action = "Telescope app",
            key = "a",
          },
          {
            desc = " Settings",
            group = "Number",
            action = ":e $MYVIMRC | cd %:p:h",
            key = "d",
          },
          {
            desc = " Quit",
            group = "@macro",
            action = "q!",
            key = "q",
          },
        },
      },
    })
  end,
  lazy = true,
  event = require("utils.lazy_loading").dashboard,
  cmd = "Dashboard",
}
