local null_ls = require "null-ls"
local fmt = null_ls.builtins.formatting
local act = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local prettier_files = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.js",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.toml",
  ".prettierrc.mjs",
  ".prettierrc.cjs",
}

local eslint_files = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.json",
  ".eslintrc.mjs",
  ".eslintrc.cjs",
}

local function register_prettier()
  null_ls.register(null_ls.builtins.formatting.prettier.with {
    condition = function(utils) return utils.root_has_file { prettier_files } end,
  })
end

local function register_eslint_d()
  null_ls.register(fmt.eslint_d.with {
    condition = function(utils) return utils.root_has_file { eslint_files } end,
  })
  null_ls.register(act.eslint_d.with {
    condition = function(utils) return utils.root_has_file { eslint_files } end,
  })
  null_ls.register(diagnostics.eslint_d.with {
    condition = function(utils) return utils.root_has_file { eslint_files } end,
  })
end

return {
  "jay-babu/mason-null-ls.nvim",
  opts = function(_, opts)
    opts.handlers = {
      prettier = register_prettier,
      eslint_d = register_eslint_d,
    }
  end,
}
