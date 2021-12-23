local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua' 
  use 'hrsh7th/cmp-nvim-lsp' 
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"
  use 'L3MON4D3/LuaSnip'
  use 'ray-x/lsp_signature.nvim'

  -- fuzzy finding
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- tree sitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- colorscheme
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'gruvbox-community/gruvbox'

  -- statusline
  use 'itchyny/lightline.vim' -- Fancier statusline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- useful stuff
  use 'jiangmiao/auto-pairs'
  -- use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'karb94/neoscroll.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'abzcoding/which-key.nvim'
  use { 'simrat39/rust-tools.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } }
  use 'xiyaowong/nvim-transparent'

  -- git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  -- cheat sheet
  use {
  'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-cheat.sh'
--  use 'nvim-lua/popup.nvim'

  -- debugger
--  use 'mfussenegger/nvim-dap' -- debugging
end)

