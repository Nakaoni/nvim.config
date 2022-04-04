local fn = vim.fn

-- Auto install packer.nvim when cloned
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install plugins
return require('packer').startup(function(use)
  -- Package Manager
  use "wbthomason/packer.nvim"

  use "hrsh7th/nvim-cmp" -- completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- command line completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Treesitter
  use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd',  }
  }
  use "nvim-telescope/telescope-media-files.nvim"

  -- Colorscheme
  use "LunarVim/darkplus.nvim"
  use "Mofiqul/vscode.nvim"

  -- Inactive windows
  use "sunjon/shade.nvim"

  -- Status line
  use "nvim-lualine/lualine.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim" -- For formatters and linters

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Comments
  use "numToStr/Comment.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- nvim-tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- Dashboard
  use "glepnir/dashboard-nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

