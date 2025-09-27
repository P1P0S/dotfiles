-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local null_ls = require "null-ls"
local fmt = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

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

local function register_prettier()
  null_ls.register(fmt.prettier.with {
    condition = function(utils) return utils.root_has_file(prettier_files) end,
  })
end

local function register_biome()
  null_ls.register(fmt.biome.with {
    condition = function(utils) return utils.root_has_file { "biome.json" } end,
  })
end

local function register_checkstyle()
  null_ls.register(diag.checkstyle.with {
    condition = function(utils) return utils.root_has_file { "checkstyle.xml" } end,
    extra_args = function(params) return { "-c", params.root .. "/checkstyle.xml" } end,
  })
end

local function register_tsserver_formatting()
  null_ls.register(fmt.tsserver.with {
    condition = function(utils)
      local has_prettier = utils.root_has_file(prettier_files)
      local has_biome = utils.root_has_file { "biome.json" }
      local has_eslint = utils.root_has_file {
        ".eslintrc",
        ".eslintrc.json",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
      }
      return not (has_prettier or has_biome or has_eslint)
    end,
  })
end

return {
  "jay-babu/mason-null-ls.nvim",
  opts = function(_, opts)
    opts.handlers = {
      prettier = register_prettier,
      biome = register_biome,
      checkstyle = register_checkstyle,
      -- tsserver = register_tsserver_formatting,
    }
  end,
}
