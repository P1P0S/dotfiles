return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local nls = require "null-ls"
    local fmt = nls.builtins.formatting
    local diagnostics = nls.builtins.diagnostics

    config.sources = {
      fmt.stylua,
      fmt.prettier,
      diagnostics.eslint.with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc.js", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" }
        end,
      },
    }

    return config
  end,
}
