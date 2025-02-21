local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting

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
	null_ls.register(fmt.prettier.with({
		condition = function(utils)
			return utils.root_has_file({ prettier_files })
		end,
	}))
end

local function register_biome()
	null_ls.register(fmt.biome.with({
		condition = function(utils)
			return utils.root_has_file({ "biome.json" })
		end,
	}))
end

return {
	"jay-babu/mason-null-ls.nvim",
	opts = function(_, opts)
		opts.handlers = {
			prettier = register_prettier,
			biome = register_biome,
		}
	end,
}
