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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require('treesitter-config')
    end
  }

  -- Nvimtree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = function ()
      require('nvim-tree-config')
    end
  }

  -- Statusline and bufferline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = "BufWinEnter",
    config = function ()
      require('lualine').setup {
        extensions = {'nvim-tree'},
      }
      -- require('lualine-config.my-costume')
    end
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = function ()
      require('bufferline-config')
    end
  }

  -- Dashboard
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      event = "BufWinEnter",
      config = function ()
          -- require'alpha'.setup(require'alpha.themes.startify'.opts)
          require('alpha-config')
      end
  }

  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
  }
  use {
    'neovim/nvim-lspconfig',
    after = "nvim-lsp-installer",
    config = function ()
      require('lsp-config')
    end
  }

  -- LSP Saga
  use {
    'tami5/lspsaga.nvim',
    after = "nvim-lspconfig",
    config = function ()
      require('lspsaga')
    end
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    after = "nvim-lspconfig",
    config = function ()
      require('cmp-config')
    end
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/cmp-nvim-lua',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/cmp-buffer',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/cmp-path',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/cmp-cmdline',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/cmp-calc',
    after = "nvim-cmp",
  }
  use {
    'onsails/lspkind-nvim',
    before_each = {"nvim-cmp"},
  }
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
  use {
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end
  }
  use {
    'p00f/nvim-ts-rainbow',
  }

  -- -- Indentation
  use {
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-treesitter",
    config = function ()
      require('indentation-config')
    end
  }

  -- Formatter
  use {
    'lukas-reineke/format.nvim',
    after = "nvim-lspconfig",
    config = function ()
      require('formatter-config')
    end
  }

  -- Snippets
  use {
    'hrsh7th/cmp-vsnip',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/vim-vsnip',
    after = "nvim-cmp",
  }

  -- Diagnostic list
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    after = "nvim-lspconfig",
    config = function()
      require("trouble").setup {}
    end
  }

  -- Symbols Outline
  use {
    'simrat39/symbols-outline.nvim',
    config = function ()
      require('symbols-outline-config')
    end
  }

  -- Commentary
  use {
    'b3nj5m1n/kommentary',
    event = "BufWinEnter",
    config = function ()
      require('commentary-config')
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'},
    },
    cmd = "Telescope",
    config = function ()
      require('telescope-config')
    end
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
  }

  -- -- Project Manager
  use {
    'ahmedkhalf/project.nvim',
    event = "BufWinEnter",
    config = function ()
      require('projects-config')
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
      after = "telescope.nvim",
      config = function ()
        require('telescope').load_extension('sessions')
        require('session-manager-config')
      end
    }

  -- Whichkey
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = function ()
      require('whichkey-config')
    end
  }

  -- HOP
  use {
    'phaazon/hop.nvim',
    event = "BufWinEnter",
    config = function()
      require'hop'.setup()
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    event = "BufWinEnter",
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release',
    config = function ()
      require('gitsigns-config')
    end
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    before_each = {"which-key.nvim"},
    config = function ()
      require('terminal-config')
    end
  }

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    event = "BufWinEnter",
    config = function()
      require'colorizer'.setup()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
