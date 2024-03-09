return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local biome = require("null-ls").builtins.formatting.rome.with {
      condition = function(utils) return utils.root_has_file { "biome.json" } end,
      command = "biome",
      args = {
        "check",
        "--apply-unsafe",
        "--formatter-enabled=true",
        "--organize-imports-enabled=true",
        "--skip-errors",
        "$FILENAME",
      },
    }
    opts.sources = vim.list_extend(opts.sources or {}, {
      biome,
    })
  end,
}
