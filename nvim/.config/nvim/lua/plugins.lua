local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  -- Lsp zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      -- {'hrsh7th/nvim-cmp'},
      -- {'hrsh7th/cmp-buffer'},
      -- {'hrsh7th/cmp-path'},
      -- {'saadparwaiz1/cmp_luasnip'},
      -- {'hrsh7th/cmp-nvim-lsp'},
      -- {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      -- {'L3MON4D3/LuaSnip'},
      -- {'rafamadriz/friendly-snippets'},
    }
  }

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
  --buffer switcher
  use 'ghillb/cybu.nvim'

  -- tree sitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use 'NvChad/nvim-colorizer.lua'

  -- explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- colorscheme
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/vscode.nvim'
  use 'marko-cerovac/material.nvim'

  -- statusline
  use 'itchyny/lightline.vim' -- Fancier statusline
  --use 'christianchiarulli/lualine.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use { 'fgheng/winbar.nvim' }

  -- useful stuff
  -- use 'jiangmiao/auto-pairs'
  -- use 'windwp/nvim-autopairs'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'karb94/neoscroll.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'numToStr/Comment.nvim'
  --use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'folke/which-key.nvim'
  use { 'simrat39/rust-tools.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } }
  use 'sbdchd/neoformat'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use 'lervag/vimtex'
  use 'gpanders/editorconfig.nvim'
  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  --use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  -- ChatGPT
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
  use({
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  })

  -- debugger
  use 'mfussenegger/nvim-dap' -- debugging
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'theHamsta/nvim-dap-virtual-text'
end)
