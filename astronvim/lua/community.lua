-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.php" },
  -- { import = "astrocommunity.recipes.neovide" },
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.snippet.nvim-snippets" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim"},
  -- import/override with your plugins folder
}
