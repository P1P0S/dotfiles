local status, db = pcall(require, "dashboard")
if not status then
  return
end

db.setup({
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
    shortcut = {
      {
        desc = " Update",
        group = "@property",
        action = "PackerUpdate",
        key = "u",
      },
      {
        desc = " Files",
        group = "Label",
        action = "Telescope find_files find_command=rg,--hidden,--files",
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
