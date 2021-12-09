local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

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
  --   'adrianiy/cmp-tabnine',
  --   run = 'sh ./install.sh',
  --   require = 'hrsh7th/nvim-cmp'
  -- }
 	-- use {
  --   'Xrayya/cmp-tabnine',
  --   branch = 'for-Windows-native',
  --   run = 'powershell ./install.ps1',
  --   requires = 'hrsh7th/nvim-cmp'
  -- }

  -- Autopair
  use 'windwp/nvim-autopairs'
  use 'p00f/nvim-ts-rainbow'  -- Rainbow

  -- Indentation
  use "lukas-reineke/indent-blankline.nvim"

  -- Formatter
  use 'lukas-reineke/format.nvim'

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
  use { 'simrat39/symbols-outline.nvim', }

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

  -- Project Manager
  use {
    'ahmedkhalf/project.nvim',
    config = function ()
      require('telescope').load_extension('projects')
    end
  }

  -- -- Frecency algorithm for telescope
  -- use {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   config = function()
  --     require"telescope".load_extension("frecency")
  --   end,
  --   requires = {"tami5/sqlite.lua"}
  -- }

  -- Season manager
    use {
      'Shatur/neovim-session-manager',
      config = function ()
        require('telescope').load_extension('sessions')
      end
    }

  -- Whichkey
  use 'folke/which-key.nvim'

  -- HOP
  use {
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup()
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release',
  }

  -- Terminal
  use {"akinsho/toggleterm.nvim"}

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
