local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("bluz71/vim-nightfly-colors")
  use("andweeb/presence.nvim")

  use("windwp/nvim-autopairs")
  use("nvim-treesitter/nvim-treesitter")

  use("kyazdani42/nvim-web-devicons")
  use("nvim-lua/plenary.nvim") -- Utilities
  use("nvim-telescope/telescope.nvim") -- Finder file

  use("norcalli/nvim-colorizer.lua") -- Color highlighter
  use("nvim-lualine/lualine.nvim") -- Status line
  use("akinsho/nvim-bufferline.lua")
  use("nvim-tree/nvim-tree.lua")

  use("williamboman/mason.nvim")
  use("L3MON4D3/LuaSnip") -- Snippet

  use("neovim/nvim-lspconfig") -- LSP

  use("hrsh7th/nvim-cmp") -- Completion
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("onsails/lspkind-nvim") -- vscode-like pictograms
  use("glepnir/lspsaga.nvim")

  use("jose-elias-alvarez/null-ls.nvim")

  use("folke/which-key.nvim")
  use("gelguy/wilder.nvim")
  use("j-hui/fidget.nvim")
end)
