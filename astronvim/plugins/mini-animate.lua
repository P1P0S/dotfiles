return {
  "echasnovski/mini.animate",
  -- event = "VeryLazy",
  opts = function(_, opts)
    opts.scroll = {
      enable = true,
    }
    if vim.g.neovide then
      opts.scroll = { enable = false }
      opts.cursor = { enable = true }
    end
  end,
}
