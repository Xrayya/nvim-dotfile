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
  ------------------------------
  -- Packer can manage itself --
  ------------------------------

  use 'wbthomason/packer.nvim'


  ------------
  -- Themes --
  ------------

  use ({
    { 'NLKNguyen/papercolor-theme' },
    { 'navarasu/onedark.nvim' },
    {
      'Xrayya/nvcode-color-schemes.vim',
      branch = 'delete-onedark'
    },
    { 'Avimitin/neovim-deus' },
    {
      'rose-pine/neovim',
      as = 'rose-pine',
    },
    { 'EdenEast/nightfox.nvim' },
    {"rebelot/kanagawa.nvim"},
  })


  ----------------------
  -- Treesitter stuff --
  ----------------------

  use ({
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function ()
        require('treesitter-config')
      end
    },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      after = "nvim-treesitter",
      config = function ()
        require('nvim-autopairs').setup({
          check_ts = true,
        })
      end
    },

    -- Rainbow
    {
      'p00f/nvim-ts-rainbow',
      after = "nvim-treesitter",
    },

    -- Autotag
    {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = function ()
        require('nvim-ts-autotag').setup()
      end
    },
  })


  -----------------
  -- Indentation --
  -----------------

  use {
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-treesitter",
    config = function ()
      require('indentation-config')
    end
  }


  --------------
  -- Nvimtree --
  --------------

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = function ()
      require('nvim-tree-config')
    end
  }


  -------------------------------
  -- Statusline and bufferline --
  -------------------------------

  use ({
    {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      event = "BufWinEnter",
      config = function ()
        require('lualine').setup {
          extensions = {'nvim-tree'},
        }
        -- require('lualine-config.my-costume')
      end
    },
    {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter",
      config = function ()
        require('bufferline-config')
      end
    }
  })


  ---------------
  -- Dashboard --
  ---------------
  
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      event = "BufWinEnter",
      config = function ()
          -- require'alpha'.setup(require'alpha.themes.startify'.opts)
          require('alpha-config')
      end
  }


  ---------------
  -- LSP stuff --
  ---------------

  use ({
    { 'williamboman/nvim-lsp-installer' },
    {
      'neovim/nvim-lspconfig',
      after = {"nvim-lsp-installer", "nvim-cmp", "cmp-nvim-lsp", "nlsp-settings.nvim"},
      config = function ()
        require('lsp-config')
      end
    },
    {
      'tamago324/nlsp-settings.nvim',
    },

    -- LSP Saga
    {
      'tami5/lspsaga.nvim',
      after = "nvim-lspconfig",
      config = function ()
        require('lspsaga')
      end
    },

    -- Java LSP
    {'mfussenegger/nvim-jdtls'},
  })


  --------------------
  -- Autocompletion --
  --------------------
  
  use ({
    {
      'hrsh7th/nvim-cmp',
      after = {"nvim-autopairs", "LuaSnip"},
      config = function ()
        require('cmp-config')
      end
    },
    {
      'hrsh7th/cmp-nvim-lsp',
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-nvim-lua',
      after = "nvim-cmp",
      ft = "lua",
    },
    {
      'hrsh7th/cmp-buffer',
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-path',
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-cmdline',
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-calc',
      after = "nvim-cmp",
    },

    -- Tabnine
    {
      'tzachar/cmp-tabnine',
      disable = true,
      run = 'powershell ./install.ps1',
      after = "nvim-cmp",
      requires = 'hrsh7th/nvim-cmp'
    }
  })

  --------------------
  -- Snippets stuff --
  --------------------

  use ({
    {
      "L3MON4D3/LuaSnip",
      event = "BufWinEnter",
    },
    {
      "rafamadriz/friendly-snippets",
      event = "BufWinEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      after = "nvim-cmp",
    },
  })


  ---------------------
  -- Diagnostic list --
  ---------------------

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {"Trouble", "TroubleToggle"},
    config = function()
      require("trouble").setup {}
    end
  }


  ---------------------
  -- Symbols outline --
  ---------------------

  use {
    'simrat39/symbols-outline.nvim',
    config = function ()
      require('symbols-outline-config')
    end
  }


  ----------------
  -- Commentary --
  ----------------

  use {
    'b3nj5m1n/kommentary',
    event = "BufWinEnter",
    config = function ()
      require('commentary-config')
    end
  }


  ---------------------
  -- Telescope stuff --
  ---------------------

  use ({
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-lua/popup.nvim'},
      },
      cmd = "Telescope",
      config = function ()
        require('telescope-config')
      end
    },

    -- Project Manager
    {
      'ahmedkhalf/project.nvim',
      event = "BufWinEnter",
      config = function ()
        require('projects-config')
      end
    },

    -- Frecency algorithm for telescope
    {
      "nvim-telescope/telescope-frecency.nvim",
      disable = true,
      config = function()
        require"telescope".load_extension("frecency")
      end,
      requires = {"tami5/sqlite.lua"}
    },

    -- Season manager
    {
      'Shatur/neovim-session-manager',
      after = "telescope.nvim",
      config = function ()
        require('telescope').load_extension('sessions')
        require('session-manager-config')
      end
    }
  })


  --------------
  -- Whichkey --
  --------------

  use {
    'folke/which-key.nvim',
    keys = {"<Leader>", "]", "[", "z"},
    config = function ()
      require('whichkey-config')
    end
  }


  ---------
  -- HOP --
  ---------

  use {
    'phaazon/hop.nvim',
    event = "BufWinEnter",
    config = function()
      require'hop'.setup()
    end
  }


  --------------
  -- Gitsigns --
  --------------
  
  use {
    'lewis6991/gitsigns.nvim',
    event = "BufWinEnter",
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require('gitsigns-config')
    end
  }


  --------------
  -- Terminal --
  --------------

  use {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function ()
      require('terminal-config')
    end
  }


  ---------------
  -- Colorizer --
  ---------------

  use {
    'norcalli/nvim-colorizer.lua',
    event = "BufWinEnter",
    config = function()
      require'colorizer'.setup()
    end,
  }


  ------------------------
  -- Markdown previewer --
  ------------------------

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
