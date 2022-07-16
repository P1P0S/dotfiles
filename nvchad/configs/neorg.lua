local present, neorg = pcall(require, "neorg")

if not present then
   return
end

local icons = require "custom.configs.icons"

local options = {
   load = {
      ["core.defaults"] = {},

      ["core.norg.dirman"] = {
         config = {
            workspaces = {
               webdev = "~/Documents/notes/webdev",
               lessons = "~/Documents/notes/lessons",
               design = "~/Documents/notes/design",
            },
         },
      },

      ["core.norg.concealer"] = {
         config = {
            icons = {
               todo = icons.todo,
               list = icons.list,
               heading = icons.heading,
            },
         },
      },
   },
}

neorg.setup(options)
