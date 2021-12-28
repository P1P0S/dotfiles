local nightfox = require('nightfox')

nightfox.setup({
    fox = "nightfox",
    transparent = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      functions = "italic,bold"
    },
    inverse = {
      match_paren = true
    }

})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
