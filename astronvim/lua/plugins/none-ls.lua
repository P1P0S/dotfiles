-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

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

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local fmt = null_ls.builtins.formatting

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      fmt.stylua,

      -- Eslint
      null_ls.register(require("none-ls.formatting.eslint").with {
        condition = function(utils) return utils.root_has_file { eslint_files } end,
      }),
      null_ls.register(require("none-ls.diagnostics.eslint").with {
        condition = function(utils) return utils.root_has_file { eslint_files } end,
        -- diagnostics_format = "[eslint] #{m}\n(#{c})",
      }),
      null_ls.register(require("none-ls.code_actions.eslint").with {
        condition = function(utils) return utils.root_has_file { eslint_files } end,
      }),
    }
    return config -- return final config table
  end,
}
