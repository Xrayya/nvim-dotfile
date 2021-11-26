return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes & Treesitter
  use 'NLKNguyen/papercolor-theme'
  use 'LunarVim/onedarker.nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'Avimitin/neovim-deus'
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
      config =  function () require('lualine').setup {
        extensions = {'nvim-tree'},
      } end
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- use {
  --   'glepnir/galaxyline.nvim',
  --     branch = 'main',
  --     requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }
  -- use 'Avimitin/nerd-galaxyline'

  -- Dashboard
  use 'glepnir/dashboard-nvim'

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

  -- Indentation
  use "lukas-reineke/indent-blankline.nvim"

  -- Snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Diagnostic list
  -- use 'onsails/diaglist.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  -- Commentary
  use 'b3nj5m1n/kommentary'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Whichkey
  use 'folke/which-key.nvim'

  -- HOP
  use {
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup()
    end
  }

  -- Rooter
  use 'airblade/vim-rooter'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Terminal
  use "numToStr/FTerm.nvim"
  use 'voldikss/vim-floaterm'

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

end)
