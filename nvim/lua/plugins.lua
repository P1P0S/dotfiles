local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("rcarriga/nvim-notify")

  use("bluz71/vim-nightfly-colors") -- Themes
  use("maxmx03/FluoroMachine.nvim")
  use("catppuccin/nvim")
  use("EdenEast/nightfox.nvim")
  use("folke/tokyonight.nvim")

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
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

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
  use("lukas-reineke/indent-blankline.nvim")
  use("numToStr/Comment.nvim")
  use("lewis6991/gitsigns.nvim")
  use("glepnir/dashboard-nvim")
  use("windwp/nvim-ts-autotag")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
