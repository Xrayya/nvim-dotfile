return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes & Treesitter
  use 'christianchiarulli/nvcode-color-schemes.vim'
  --use 'markvincze/panda-vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Nvimtree
  use {
    'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }

  -- Statusline and bufferline
  use {
    'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config =  function () require('lualine').setup () end
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind-nvim'
  -- use {
  --   'tzachar/cmp-tabnine',  -- Tabnine for cmp
  --   run='./install.sh',
  --   requires = 'hrsh7th/nvim-cmp'
  -- }

  -- Autopair
  use 'windwp/nvim-autopairs'
  use 'p00f/nvim-ts-rainbow'  -- Rainbow

  -- Snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Diagnostic list
  use 'onsails/diaglist.nvim'

  -- Commentary
  use 'b3nj5m1n/kommentary'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Rooter
  use 'airblade/vim-rooter'

end)
