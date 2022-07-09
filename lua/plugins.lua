local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
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

  use({
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
    { "rebelot/kanagawa.nvim" },
    { 'shaunsingh/moonlight.nvim' },
    { 'Xrayya/tokyonight.nvim' },
  })


  ----------------------
  -- Treesitter stuff --
  ----------------------

  use({
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('treesitter-config')
      end
    },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      after = "nvim-treesitter",
      config = function()
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
      config = function()
        require('nvim-ts-autotag').setup()
      end
    },

    -- Commentstring
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      after = "nvim-treesitter",
    },

    -- GPS / context
    {
      "Xrayya/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
      config = function()
        require('gps-config')
      end
    },
  })


  -----------------
  -- Indentation --
  -----------------

  use {
    "lukas-reineke/indent-blankline.nvim",
    commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025",
    after = "nvim-treesitter",
    config = function()
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
    config = function()
      require('nvim-tree-config')
    end
  }


  -------------------------------
  -- Statusline and bufferline --
  -------------------------------

  use({
    {
      'nvim-lualine/lualine.nvim',
      commit = "5113cdb32f9d9588a2b56de6d1df6e33b06a554a",
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      event = "BufWinEnter",
      config = function()
        require('lualine').setup {
          extensions = { 'nvim-tree', 'symbols-outline', 'toggleterm' },
        }
        require('lualine-config.my-lualine')
      end
    },
    {
      'akinsho/bufferline.nvim',
      commit = "68839d62785edfb4ff7a7b3c1e9f4b64d55749e8",
      requires = 'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter",
      config = function()
        require('bufferline-config')
      end
    },
    {
      'matbme/JABS.nvim',
      commit = "3a7a14dbbbb404b66bed154a27dba4745f385e50",
      requires = 'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter",
      config = function()
        require('jabs-config')
      end
    }
  })


  ---------------
  -- Dashboard --
  ---------------

  use {
    'goolord/alpha-nvim',
    commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94",
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = "BufWinEnter",
    config = function()
      -- require'alpha'.setup(require'alpha.themes.startify'.opts)
      require('alpha-config')
    end
  }


  ---------------
  -- LSP stuff --
  ---------------

  use({
    { 'williamboman/nvim-lsp-installer' },
    {
      'neovim/nvim-lspconfig',
      after = { "nvim-lsp-installer", "nvim-cmp", "cmp-nvim-lsp", "nlsp-settings.nvim", "vim-illuminate" },
      config = function()
        require('lsp-config')
      end
    },
    {
      'tamago324/nlsp-settings.nvim',
      disable = true,
    },

    -- LSP Saga
    {
      'tami5/lspsaga.nvim',
      after = "nvim-lspconfig",
      config = function()
        require('lspsaga-config')
      end
    },

    -- Java LSP
    { 'mfussenegger/nvim-jdtls' },

    -- Illuminate
    {
      'RRethy/vim-illuminate',
      commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5",
      event = "BufWinEnter",
      config = function()
        require('illuminate-config')
      end,
    },
  })


  --------------------
  -- Autocompletion --
  --------------------

  use({
    {
      'hrsh7th/nvim-cmp',
      commit = "9897465a7663997b7b42372164ffc3635321a2fe",
      after = { "nvim-autopairs", "vim-vsnip" },
      config = function()
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
      commit = "981baf9525257ac3269e1b6701e376d6fbff6921",
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-calc',
      commit = "f7efc20768603bd9f9ae0ed073b1c129f63eb312",
      after = "nvim-cmp",
    },
    {
      'hrsh7th/cmp-nvim-lsp-signature-help',
      commit = "007dd2740d9b70f2688db01a39d6d25b7169cd57",
      after = "nvim-cmp",
    },

    -- Tabnine
    {
      'tzachar/cmp-tabnine',
      commit = "a5081776185e3c7f406e7fc3dd5f0a0ae0288e59",
      disable = true,
      run = 'powershell ./install.ps1',
      after = "nvim-cmp",
      requires = 'hrsh7th/nvim-cmp'
    }
  })

  --------------------
  -- Snippets stuff --
  --------------------

  use({
    {
      "hrsh7th/vim-vsnip",
      commit = "8f199ef690ed26dcbb8973d9a6760d1332449ac9",
      event = "BufWinEnter",
    },
    {
      "rafamadriz/friendly-snippets",
      event = "BufWinEnter",
    },
    {
      "hrsh7th/cmp-vsnip",
      commit = "0abfa1860f5e095a07c477da940cfcb0d273b700",
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
    cmd = { "Trouble", "TroubleToggle" },
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
    config = function()
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
    config = function()
      require('commentary-config')
    end
  }


  ---------------------
  -- Telescope stuff --
  ---------------------

  use({
    {
      'nvim-telescope/telescope.nvim',
      commit = "b98b9a93c67cb999493ccdc602e711c8a7a98d64",
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
      },
      cmd = "Telescope",
      config = function()
        require('telescope-config')
      end
    },

    -- Project Manager
    {
      'ahmedkhalf/project.nvim',
      commit = "541115e762764bc44d7d3bf501b6e367842d3d4f",
      event = "BufWinEnter",
      config = function()
        require('projects-config')
      end
    },

    -- Frecency algorithm for telescope
    {
      "nvim-telescope/telescope-frecency.nvim",
      disable = true,
      after = "telescope.nvim",
      requires = { "tami5/sqlite.lua" }
    },

    -- FZF Native
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      disable = true,
      after = "telescope.nvim",
      requires = { "nvim-telescope/telescope.nvim" },
      run = "make",
    }
  })


  --------------
  -- Whichkey --
  --------------

  use {
    'folke/which-key.nvim',
    commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
    keys = { "<Leader>", "]", "[", "z" },
    config = function()
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
      require 'hop'.setup()
    end
  }


  --------------
  -- Gitsigns --
  --------------

  use {
    'lewis6991/gitsigns.nvim',
    commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff",
    event = "BufWinEnter",
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns-config')
    end
  }


  --------------
  -- Terminal --
  --------------

  use {
    "akinsho/toggleterm.nvim",
    commit = "04174e19196ecef43dd159b29d4e6ddb07b80909",
    event = "BufWinEnter",
    config = function()
      require('terminal-config')
    end
  }


  --------------
  -- Terminal --
  --------------

  use {
    'pianocomposer321/yabs.nvim',
    commit = "88bdb5c557448960be3cb9d3da64e52009e7bef9",
    requires = { 'nvim-lua/plenary.nvim' }
  }


  ---------------
  -- Notification --
  ------------------

  use {
    "rcarriga/nvim-notify",
    commit = "7caeaaef257ecbe95473ec79e5a82757b544f1fd",
    event = "BufWinEnter",
    config = function()
      require("notify").setup({
        timeout = 1000,
        background_colour = "#000000",
      })
      vim.notify = require("notify")
    end
  }


  ---------------------
  -- Session Manager --
  ---------------------

  use {
    "Shatur/neovim-session-manager",
    commit = "9652b392805dfd497877342e54c5a71be7907daf",
    requires = { 'nvim-lua/plenary.nvim' },
    event = "BufWinEnter",
    config = function()
      require('session-manager-config')
    end
  }

  ---------------
  -- Color and stuff --
  ---------------

  use({
    {
      'norcalli/nvim-colorizer.lua',
      event = "BufWinEnter",
      config = function()
        require('colorizer-config')
      end,
    },
    {
      "ziontee113/color-picker.nvim",
      event = "BufWinEnter",
      config = function()
        require("color-picker-config")
      end
    },
    {
      "max397574/colortils.nvim",
      disable = true,
      event = "BufWinEnter",
      config = function()
        require("colortils-config")
      end
    }
  })


  ------------------------
  -- Markdown previewer --
  ------------------------

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })


  ---------------------
  -- Discord Presece --
  ---------------------

  use {
    "andweeb/presence.nvim",
    commit = "660bd8815ef8da029fa0058f76ac7fa2ca8f9ec7",
    event = "BufWinEnter",
    config = {
      function()
        require('discord-presence-config')
      end
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
