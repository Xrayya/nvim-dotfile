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
    commit = "79258f1d670277016523e13c0a88daa25070879f",
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
          extensions = {'nvim-tree', 'symbols-outline', 'toggleterm'},
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
      commit = "0e65333c7fdc284d53a489ed2cef7219289ea0fe",
      after = {"nvim-autopairs", "LuaSnip"},
      config = function ()
        require('cmp-config')
      end
    },
    {
      'hrsh7th/cmp-nvim-lsp',
      commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-nvim-lua',
      commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
      after = "nvim-cmp",
      ft = "lua",
    },
    {
      'hrsh7th/cmp-buffer',
      commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-path',
      commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e",
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-calc',
      commit = "f7efc20768603bd9f9ae0ed073b1c129f63eb312",
      after = "nvim-cmp",
    },

    -- Tabnine
    {
      'tzachar/cmp-tabnine',
      commit = "e23d32a76304496aade4e4b285751a6a8b505491",
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
      commit = "a12441e0598e93e67235eba67c8e6fbffc896f06",
      event = "BufWinEnter",
    },
    {
      "rafamadriz/friendly-snippets",
      commit = "d27a83a363e61009278b6598703a763ce9c8e617",
      event = "BufWinEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
      after = "nvim-cmp",
    },
  })


  ---------------------
  -- Diagnostic list --
  ---------------------

  use {
    "folke/trouble.nvim",
    commit = "da61737d860ddc12f78e638152834487eabf0ee5",
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
    commit = "15ae99c27360ab42e931be127d130611375307d5",
    config = function ()
      require('symbols-outline-config')
    end
  }


  ----------------
  -- Commentary --
  ----------------

  use {
    'b3nj5m1n/kommentary',
    commit = "533d768a140b248443da8346b88e88db704212ab",
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
      commit = "d88b44ddf14670cffa9fdb1eaca7a0429a973653",
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
      commit = "541115e762764bc44d7d3bf501b6e367842d3d4f",
      event = "BufWinEnter",
      config = function ()
        require('projects-config')
      end
    },

    -- Frecency algorithm for telescope
    {
      "nvim-telescope/telescope-frecency.nvim",
      disable = true,
      after = "telescope.nvim",
      requires = {"tami5/sqlite.lua"}
    },
  })


  --------------
  -- Whichkey --
  --------------

  use {
    'folke/which-key.nvim',
    commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
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
    commit = "03675eba34d416dd22ad49b2d0e52b6113b434ad",
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
    commit = "3543443eb3856fbe4a9d70f3fe8dc73e007199a1",
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
     commit = "ce755e3a07f2464287dc60ed448fdbbe6ea157f5",
     event = "BufWinEnter",
     config = function ()
       require('terminal-config')
     end
   }


  --------------
  -- Terminal --
  --------------

  use {
    'pianocomposer321/yabs.nvim',
    commit = "c2a8b6e606292f77e4117d6e3560f1cf3652c51d",
    requires = { 'nvim-lua/plenary.nvim' }
  }

  
---------------
  -- Notification --
  ------------------

  use {
    "rcarriga/nvim-notify",
    commit = "4ef4c133fb92527b928603bf1ce43e729d09db50",
    event = "BufWinEnter",
    config = function ()
      require("notify").setup({
        timeout = 1000,
      })
      vim.notify = require("notify")
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

use({
  "iamcco/markdown-preview.nvim",
  run = "cd app && npm install",
  setup = function()
    vim.g.mkdp_filetypes = { "markdown" } end,
  ft = { "markdown" },
})

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
