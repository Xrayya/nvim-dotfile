local fn = vim.fn

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua | Lazy sync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  print("Error occured when loading packer.nvim")
  return
end

-- Have packer use a popup window
-- lazy.init({
--   display = {
--     open_fn = function()
--       return require("packer.util").float({ border = "rounded" })
--     end,
--   },
-- })

lazy.setup({
  ------------------------------
  -- Packer can manage itself --
  ------------------------------

  { "wbthomason/packer.nvim" },

  ------------
  -- Themes --
  ------------

  { "navarasu/onedark.nvim" },
  {
    "Xrayya/nvcode-color-schemes.vim",
    branch = "delete-onedark",
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
  },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "Xrayya/tokyonight.nvim" },
  -- { "folke/tokyonight.nvim", version="v1.1.0" },
  {
    "LunarVim/Colorschemes",
    as = "lvim-colorschemes",
  },

  ----------------------
  -- Treesitter stuff --
  ----------------------

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("xrayya.treesitter")
    end,
  },

  -- Autopair
  {
    "windwp/nvim-autopairs",
    config = function()
      require("xrayya.autopairs")
    end,
  },

  -- Rainbow
  {
    "p00f/nvim-ts-rainbow",
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
  },

  -- Commentstring
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },

  -- Endwise
  {
    "RRethy/nvim-treesitter-endwise",
  },

  -----------------
  -- Indentation --
  -----------------

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "v2.20.2",
    event = "BufWinEnter",
    config = function()
      require("xrayya.indent-blankline")
    end,
  },

  --------------
  -- Nvimtree --
  --------------

  {
    "kyazdani42/nvim-tree.lua",
    commit = "bb375fb20327c49920c41d2b51c1ce2f4fe7deb3",
    dependencies = "kyazdani42/nvim-web-devicons",
    cmd = "NvimTreeToggle",
    config = function()
      require("xrayya.nvim-tree")
    end,
  },

  -------------------------------
  -- Statusline and buffer manager --
  -------------------------------

  {
    {
      "nvim-lualine/lualine.nvim",
      commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e",
      dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
      config = function()
        require("xrayya.lualine")
      end,
    },
    {
      "akinsho/bufferline.nvim",
      enabled = false,
      commit = "68839d62785edfb4ff7a7b3c1e9f4b64d55749e8",
      dependencies = "kyazdani42/nvim-web-devicons",
      config = function()
        require("xrayya.bufferline")
      end,
    },
    {
      "ghillb/cybu.nvim",
      branch = "main",
      dependencies = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("xrayya.cybu")
      end,
    },
  },

  ---------------
  -- Dashboard --
  ---------------

  {
    "goolord/alpha-nvim",
    commit = "87c204040e3f5d4c1c95067b35905d8f8a2f2545",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("xrayya.alpha")
    end,
    -- config = function()
    --   require("alpha").setup(require("alpha.themes.dashboard").config)
    -- end,
  },

  ---------------------
  -- Package manager --
  ---------------------

  {
    "williamboman/mason.nvim",
    config = function()
      require("xrayya.mason")
    end,
  },

  ---------------
  -- LSP stuff --
  ---------------

  {
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require("lsp-config")
      end,
    },
    {
      "tamago324/nlsp-settings.nvim",
      enabled = false,
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },

    -- Renamer
    {
      "filipdutescu/renamer.nvim",
      version = "v5.1.0",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("renamer-config")
      end,
    },

    {
      "rmagatti/goto-preview",
      commit = "82ce83ae589be7a59e4ec5cfbbf82d9f5eb8bded",
      dependencies = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("xrayya.goto-preview")
      end,
    },

    -- Java LSP
    {
      "mfussenegger/nvim-jdtls",
      version = "0.2.0",
      ft = "java",
    },

    -- Typescript LSP
    {
      "jose-elias-alvarez/typescript.nvim",
      commit = "f66d4472606cb24615dfb7dbc6557e779d177624",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
      event = "BufWinEnter",
    },

    -- Illuminate
    -- NOTE: keep this one outdated for now, hard to configure the highlight
    -- FIXME: need help
    {
      "RRethy/vim-illuminate",
      commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
      config = function()
        require("xrayya.illuminate")
      end,
    },

    -- Inlay hints
    {
      "lvimuser/lsp-inlayhints.nvim",
      enabled = false,
      commit = "62c7b8dd8ac9933b071912fe3c789ef2cb704672",
      -- config = function()
      --   require("lsp-inlayhints-config")
      -- end,
    },

    {
      "ofirgall/inlay-hints.nvim",
      commit = "d26b6158349e311731ce2fbd5052ca45f8d8d792",
      config = function()
        require("lsp-inlayhints-config")
      end,
    },

    -- LSP lines
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      name = "lsp_lines.nvim",
      config = function()
        require("xrayya.lsp-lines")
      end,
    },

    -- null-ls
    {
      "jose-elias-alvarez/null-ls.nvim",
    },

    -- Schemastore
    {
      "b0o/SchemaStore.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },
    {
      "j-hui/fidget.nvim",
      commit = "0ba1e16d07627532b6cae915cc992ecac249fb97",
      config = function()
        require("xrayya.fidget")
      end,
    },
  },

  --------------------
  -- Autocompletion --
  --------------------

  {
    {
      "hrsh7th/nvim-cmp",
      commit = "c49ad26e894e137e401b1d294948c46327877eaf",
      config = function()
        require("xrayya.cmp")
      end,
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
      commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
      ft = "lua",
    },
    {
      "hrsh7th/cmp-buffer",
      commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    },
    {
      "hrsh7th/cmp-path",
      commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    },
    {
      "hrsh7th/cmp-calc",
      commit = "f7efc20768603bd9f9ae0ed073b1c129f63eb312",
    },
    {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      commit = "d2768cb1b83de649d57d967085fe73c5e01f8fd7",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },
    {
      "rcarriga/cmp-dap",
      enabled = false,
      commit = "a67883cfe574923d3414035ba16159c0ed6d8dcf",
    },
    {
      "hrsh7th/cmp-cmdline",
      commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
      dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
      },
    },

    -- Tabnine
    {
      "tzachar/cmp-tabnine",
      commit = "a5081776185e3c7f406e7fc3dd5f0a0ae0288e59",
      enabled = false,
      build = "powershell ./install.ps1",
      dependencies = "hrsh7th/nvim-cmp",
    },
  },

  --------------------
  -- Snippets stuff --
  --------------------

  {
    -- luasnip
    {
      "L3MON4D3/LuaSnip",
      commit = "e77fa9ad0b1f4fc6cddf54e51047e17e90c7d7ed",
      config = function()
        require("xrayya.luasnip")
      end,
    },
    {
      "saadparwaiz1/cmp_luasnip",
      commit = "18095520391186d634a0045dacaa346291096566",
      dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
      },
    },

    -- snippets library
    {
      "rafamadriz/friendly-snippets",
      dependencies = {
        "hrsh7th/nvim-cmp",
      },
    },
  },

  ---------------------
  -- Diagnostic list --
  ---------------------

  {
    "folke/trouble.nvim",
    -- commit = "ed65f84abc4a1e5d8f368d7e02601fc0357ea15e",
    version = "v2.2.2",
    dependencies = "kyazdani42/nvim-web-devicons",
    cmd = { "Trouble", "TroubleToggle" },
    config = function()
      require("trouble").setup({})
    end,
  },

  ------------------
  -- Todo-Comments --
  ------------------
  {
    "folke/todo-comments.nvim",
    -- commit = "61240662fd9ffa4a546db57abcc50b97f6fab27b",
    version = "v1.1.0",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("xrayya.todo-comments")
    end,
  },

  ---------------------
  -- Symbols outline --
  ---------------------

  {
    "simrat39/symbols-outline.nvim",
    commit = "512791925d57a61c545bc303356e8a8f7869763c",
    config = function()
      require("xrayya.symbols-outline")
    end,
  },

  -------------
  -- Context --
  -------------

  {
    "SmiteshP/nvim-navic",
    commit = "83dc174da915f9dbc9b51169e9b62a2e0d42b527",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("xrayya.navic")
    end,
  },

  ----------------
  -- Commentary --
  ----------------

  {
    "numToStr/Comment.nvim",
    -- commit = "7bb563ff2d811a63b207e9de63e3e9c0877cb6d5",
    version = "v0.8.0",
    config = function()
      require("xrayya.commentary")
    end,
  },

  ------------
  -- Tabout --
  ------------

  -- doesn't seem to work if you also use vim-vsnip
  {
    "abecodes/tabout.nvim",
    commit = "0d275c8d25f32457e67b5c66d6ae43f26a61bce5",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("xrayya.tabout")
    end,
  },

  ---------------------
  -- Telescope stuff --
  ---------------------

  {
    {
      "nvim-telescope/telescope.nvim",
      commit = "f2645c13205abb9ee3dbcee68416645c69b863c8",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
      config = function()
        require("xrayya.telescope")
      end,
    },

    -- Project Manager
    {
      "ahmedkhalf/project.nvim",
      commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
      config = function()
        require("xrayya.projects")
      end,
    },

    -- Frecency algorithm for telescope
    {
      "nvim-telescope/telescope-frecency.nvim",
      enabled = false,
      dependencies = { "tami5/sqlite.lua" },
    },

    -- FZF Native
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      commit = "580b6c48651cabb63455e97d7e131ed557b8c7e2",
      dependencies = {
        "nvim-telescope/telescope.nvim",
      },
      build = "make",
    },

    -- UI select handler
    {
      "nvim-telescope/telescope-ui-select.nvim",
      commit = "62ea5e58c7bbe191297b983a9e7e89420f581369",
      dependencies = {
        "nvim-telescope/telescope.nvim",
      },
    },
  },

  ---------------------------------------------
  -- Debug Adapter Protocol client and stuff --
  ---------------------------------------------
  {

    -- DAP client
    {
      "mfussenegger/nvim-dap",
      version = "0.6.0",
    },

    -- UI views vscode-like for nvim-dap
    {
      -- FIXME: error notification
      "rcarriga/nvim-dap-ui",
      version = "v3.8.0",
    },

    -- Bridge for mason.nvim and nvim-dap
    {
      -- TODO: update
      -- FIXME: breaking change
      "jay-babu/mason-nvim-dap.nvim",
      commit = "d6cb770928b5cb9a6e3880d6bbb58858c1deeb18",
      config = function()
        require("xrayya.dap")
      end,
    },

    -- Show virtual text for nvim-dap
    {
      "theHamsta/nvim-dap-virtual-text",
      commit = "9dc45a6eb33871f4c5cb2ba08fa307467657471e",
      config = function()
        require("xrayya.dap-virtual-text")
      end,
    },
  },

  --------------
  -- Whichkey --
  --------------

  {
    "folke/which-key.nvim",
    version = "v1.4.0",
    config = function()
      require("xrayya.whichkey")
    end,
  },

  ---------
  -- HOP --
  ---------

  {
    "phaazon/hop.nvim",
    version = "v2.0.3",
    config = function()
      require("xrayya.hop")
    end,
  },

  --------------
  -- Gitsigns --
  --------------

  {
    "lewis6991/gitsigns.nvim",
    version = "v0.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("xrayya.gitsigns")
    end,
  },

  --------------
  -- Terminal --
  --------------

  {
    -- TODO: linux compatibility
    "akinsho/toggleterm.nvim",
    commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a",
    config = function()
      require("xrayya.toggleterm")
    end,
  },

  -----------------
  -- Taks Runner --
  -----------------

  {
    -- TODO: linux compatibility
    "jedrzejboczar/toggletasks.nvim",
    commit = "8567f91a0eb42f17e9134fe1fed7bfce16918ba4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "akinsho/toggleterm.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("xrayya.toggletasks")
    end,
  },

  ------------------
  -- Notification --
  ------------------

  {
    "rcarriga/nvim-notify",
    version = "v3.11.0",
    config = function()
      require("xrayya.notify")
    end,
  },

  ---------------------
  -- Session Manager --
  ---------------------

  {
    "Shatur/neovim-session-manager",
    commit = "d1883f30921193f3cff4537e27514e454e0331e9",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("xrayya.session-manager")
    end,
  },

  ---------------------
  -- Color and stuff --
  ---------------------

  {
    {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("xrayya.colorizer")
      end,
    },
    {
      "ziontee113/color-picker.nvim",
      config = function()
        require("xrayya.color-picker")
      end,
    },
    {
      "max397574/colortils.nvim",
      enabled = false,
      config = function()
        require("xrayya.colortils")
      end,
    },
  },

  ----------
  -- Numb --
  ----------

  {
    "nacro90/numb.nvim",
    config = function()
      require("xrayya.numb")
    end,
  },

  ------------------------
  -- Markdown previewer --
  ------------------------

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  ---------------------
  -- Discord Presece --
  ---------------------

  {
    "andweeb/presence.nvim",
    -- enabled = false,
    commit = "87c857a56b7703f976d3a5ef15967d80508df6e6",
    event = "BufWinEnter",
    config = {
      function()
        require("xrayya.discord-presence")
      end,
    },
  },
})
