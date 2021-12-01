return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes & Treesitter
  use 'NLKNguyen/papercolor-theme'
  use {
    'navarasu/onedark.nvim',
  }
  use {
    'Xrayya/nvcode-color-schemes.vim',
    branch = 'delete-onedark'
  }
  use 'Avimitin/neovim-deus'
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          vim.g.rose_pine_variant = 'darker'
      end
  })
  use 'EdenEast/nightfox.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Nvimtree
  use {
    'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
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
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
          -- require'alpha'.setup(require'alpha.themes.dashboard'.opts)
          require'alpha'.setup(require'alpha.themes.startify'.opts)
      end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- LSP Saga
  use 'tami5/lspsaga.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-calc'
  use 'onsails/lspkind-nvim'
  -- use {
  --   'tzachar/cmp-tabnine',  -- Tabnine for cmp
  --   -- run='sh ./install.sh',
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
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- Symbols Outline
  use {
    'simrat39/symbols-outline.nvim',
    config = function ()
      vim.g.symbols_outline = {
        width = 45,
      }
    end
}

  -- Commentary
  use 'b3nj5m1n/kommentary'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'},
    }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

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
    tag = 'release',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Terminal
  use {"akinsho/toggleterm.nvim"}

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
  }

end)