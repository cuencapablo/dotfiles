-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

	-- Packer Don't Forget
  use 'wbthomason/packer.nvim' -- packer can manage itself

	-- Color schemes
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use 'rebelot/kanagawa.nvim'

  use 'norcalli/nvim-colorizer.lua' -- CSS color highlight
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }} -- Lualine
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'} -- Bufferline
  use 'lukas-reineke/indent-blankline.nvim' -- Indent line
  use 'kyazdani42/nvim-tree.lua' -- File explorer
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', -- Telescope or, branch = '0.1.x',
     requires = { {'nvim-lua/plenary.nvim'} } }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use 'preservim/tagbar' -- Tag viewer
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- Treesitter interface

  -- For formates and Linter
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'windwp/nvim-ts-autotag'

  -- LSP Installer
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/nvim-lsp-installer'
  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  -- git labels
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup{} end }
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  use 'folke/zen-mode.nvim' -- Zen mode
  use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }) -- Markdewn preview

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
