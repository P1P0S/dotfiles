return {
  "svrana/neosolarized.nvim",
  config = function()
    require("neosolarized").setup({
      comment_italics = true,
      background_set = true,
    })

    local cb = require("colorbuddy.init")
    local colors = cb.colors
    local Group = cb.Group
    local styles = cb.styles

    Group.new("Visual", colors.none, colors.base03, styles.reverse)

  end,
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
  --lazy = true,
}
