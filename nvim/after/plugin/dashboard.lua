local status, db = pcall(require, "dashboard")
if not status then
  return
end

db.custom_header = {
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
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Find Files                  ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
  },
  {
    icon = "  ",
    desc = "Rencent Files               ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Bookmarks                   ",
    action = "Telescope marks",
  },
  {
    icon = "  ",
    desc = "Themes                      ",
    action = "Telescope colorscheme",
  },
  {
    icon = "  ",
    desc = "Settings                    ",
    action = ":e $MYVIMRC | :cd %:p:h",
  },
}
