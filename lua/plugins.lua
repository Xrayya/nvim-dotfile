local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  print("Installing packer close and reopen Neovim...")
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Error occured when loading packer.nvim")
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
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
    after = {"nvim-lsp-installer", "nvim-cmp", "cmp-nvim-lsp", "nlsp-settings.nvim"},
    config = function ()
      require('lsp-config')
    end
  }
  use {
    'tamago324/nlsp-settings.nvim',
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
    after = {"nvim-autopairs", "LuaSnip"},
    config = function ()
      require('cmp-config')
    end
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    after = "nvim-cmp",
  }
  -- use {
  --   'hrsh7th/cmp-nvim-lua',
  --   after = "nvim-cmp",
  --   ft = "lua",
  -- }
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
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    after = "nvim-cmp",
  }
  use {
    'hrsh7th/cmp-calc',
    after = "nvim-cmp",
  }
  use {
    'tzachar/cmp-tabnine',
    disable = true,
    run = 'powershell ./install.ps1',
    after = "nvim-cmp",
    requires = 'hrsh7th/nvim-cmp'
  }

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    after = "nvim-treesitter",
    config = function ()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = "nvim-treesitter",
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
    "L3MON4D3/LuaSnip",
    event = "BufWinEnter",
  }
  use {
    "rafamadriz/friendly-snippets",
    event = "BufWinEnter",
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  }

  -- Diagnostic list
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {"Trouble", "TroubleToggle"},
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
    keys = {"<Leader>", "]", "[", "z"},
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
    event = "BufWinEnter",
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

  -- Markdown previewer
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    cmd = "MarkdownPreview",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
