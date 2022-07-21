local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer. After plugins installed, close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
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
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return require("packer").startup(function(use)
  ------------------------------
  -- Packer can manage itself --
  ------------------------------

  use("wbthomason/packer.nvim")

  ------------
  -- Themes --
  ------------

  use({
    { "NLKNguyen/papercolor-theme" },
    { "navarasu/onedark.nvim" },
    {
      "Xrayya/nvcode-color-schemes.vim",
      branch = "delete-onedark",
    },
    { "Avimitin/neovim-deus" },
    {
      "rose-pine/neovim",
      as = "rose-pine",
    },
    { "EdenEast/nightfox.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "shaunsingh/moonlight.nvim" },
    { "Xrayya/tokyonight.nvim" },
    {
      "LunarVim/Colorschemes",
      as = "lvim-colorschemes",
    },
  })

  ----------------------
  -- Treesitter stuff --
  ----------------------

  use({
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("treesitter-config")
      end,
    },

    -- Autopair
    {
      "windwp/nvim-autopairs",
      after = "nvim-treesitter",
      config = function()
        require("nvim-autopairs").setup({
          check_ts = true,
        })
      end,
    },

    -- Rainbow
    {
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
    },

    -- Autotag
    {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },

    -- Commentstring
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      after = "nvim-treesitter",
    },

    -- GPS / context
    {
      "SmiteshP/nvim-navic",
      commit = "34b652cbadfa8431a313a517bdbe95bd27e37ee9",
      requires = "neovim/nvim-lspconfig",
      after = "nvim-lspconfig",
      config = function()
        require("navic-config")
      end,
    },
    {
      "Xrayya/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      after = "nvim-treesitter",
      config = function()
        require("gps-config")
      end,
    },
  })

  -----------------
  -- Indentation --
  -----------------

  use({
    "lukas-reineke/indent-blankline.nvim",
    commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025",
    after = "nvim-treesitter",
    config = function()
      require("indentation-config")
    end,
  })

  --------------
  -- Nvimtree --
  --------------

  use({
    "kyazdani42/nvim-tree.lua",
    commit = "c037c7ae848873756926d0085ae3bb8df9a99e9e",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = "NvimTreeToggle",
    config = function()
      require("nvim-tree-config")
    end,
  })

  -------------------------------
  -- Statusline and buffer manager --
  -------------------------------

  use({
    {
      "nvim-lualine/lualine.nvim",
      commit = "5113cdb32f9d9588a2b56de6d1df6e33b06a554a",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      event = "BufWinEnter",
      config = function()
        require("lualine-config")
      end,
    },
    {
      "akinsho/bufferline.nvim",
      disable = true,
      commit = "68839d62785edfb4ff7a7b3c1e9f4b64d55749e8",
      requires = "kyazdani42/nvim-web-devicons",
      event = "BufWinEnter",
      config = function()
        require("bufferline-config")
      end,
    },
    {
      "matbme/JABS.nvim",
      commit = "3a7a14dbbbb404b66bed154a27dba4745f385e50",
      requires = "kyazdani42/nvim-web-devicons",
      event = "BufWinEnter",
      config = function()
        require("jabs-config")
      end,
    },
    {
      "ghillb/cybu.nvim",
      branch = "main",
      requires = { "kyazdani42/nvim-web-devicons" },
      event = "BufWinEnter",
      config = function()
        require("cybu-config")
      end,
    },
  })

  ---------------
  -- Dashboard --
  ---------------

  use({
    "goolord/alpha-nvim",
    commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94",
    requires = { "kyazdani42/nvim-web-devicons" },
    event = "BufWinEnter",
    config = function()
      -- require'alpha'.setup(require'alpha.themes.startify'.opts)
      require("alpha-config")
    end,
  })

  ---------------
  -- LSP stuff --
  ---------------

  use({
    { "williamboman/nvim-lsp-installer" },
    {
      "neovim/nvim-lspconfig",
      after = {
        "nvim-lsp-installer",
        "nvim-cmp",
        "cmp-nvim-lsp",
        "nlsp-settings.nvim",
        "vim-illuminate",
        "null-ls.nvim",
        "SchemaStore.nvim",
      },
      config = function()
        require("lsp-config")
      end,
    },
    {
      "tamago324/nlsp-settings.nvim",
      disable = true,
    },

    -- Renamer
    {
      "filipdutescu/renamer.nvim",
      branch = "master",
      commit = "4a4707992a79f481f4882bab9b3823ac6455c942",
      requires = { { "nvim-lua/plenary.nvim" } },
      after = "nvim-lspconfig",
      config = function()
        require("renamer-config")
      end,
    },

    {
      "rmagatti/goto-preview",
      -- "Xrayya/goto-preview",
      -- branch = "add-type-definiton-preview",
      commit = "a5af27cff485b325f0ef2dcdf55ae51faed05cba",
      after = { "nvim-lspconfig", "telescope.nvim" },
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("goto-preview-config")
      end,
    },

    -- Java LSP
    {
      "mfussenegger/nvim-jdtls",
      commit = "703268d5b8479de4e0c27af93b203d56c1b53d2b",
      ft = "java",
    },

    -- Illuminate
    {
      "RRethy/vim-illuminate",
      commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5",
      event = "BufWinEnter",
      config = function()
        require("illuminate-config")
      end,
    },

    -- null-ls
    {
      "jose-elias-alvarez/null-ls.nvim",
      commit = "fbb1929b29beff82e0fc495670f00ef4b3bcbcd3",
      requires = { "nvim-lua/plenary.nvim" },
      event = "BufWinEnter",
    },

    -- Schemastore
    {
      "b0o/SchemaStore.nvim",
      event = "BufWinEnter",
    },
    {
      "j-hui/fidget.nvim",
      commit = "46d1110435f1f023c22fa95bb10b3906aecd7bde",
      event = "BufWinEnter",
      config = function()
        require("fidget-config")
      end,
    },
  })

  --------------------
  -- Autocompletion --
  --------------------

  use({
    {
      "hrsh7th/nvim-cmp",
      commit = "9897465a7663997b7b42372164ffc3635321a2fe",
      after = { "nvim-autopairs", "vim-vsnip" },
      config = function()
        require("cmp-config")
      end,
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-nvim-lua",
      commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
      after = "nvim-cmp",
      ft = "lua",
    },
    {
      "hrsh7th/cmp-buffer",
      commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-path",
      commit = "981baf9525257ac3269e1b6701e376d6fbff6921",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-calc",
      commit = "f7efc20768603bd9f9ae0ed073b1c129f63eb312",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      commit = "007dd2740d9b70f2688db01a39d6d25b7169cd57",
      after = "nvim-cmp",
    },

    -- Tabnine
    {
      "tzachar/cmp-tabnine",
      commit = "a5081776185e3c7f406e7fc3dd5f0a0ae0288e59",
      disable = true,
      run = "powershell ./install.ps1",
      after = "nvim-cmp",
      requires = "hrsh7th/nvim-cmp",
    },
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

  use({
    "folke/trouble.nvim",
    commit = "da61737d860ddc12f78e638152834487eabf0ee5",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = { "Trouble", "TroubleToggle" },
    config = function()
      require("trouble").setup({})
    end,
  })

  ---------------------
  -- Symbols outline --
  ---------------------

  use({
    "simrat39/symbols-outline.nvim",
    commit = "15ae99c27360ab42e931be127d130611375307d5",
    config = function()
      require("symbols-outline-config")
    end,
  })

  ----------------
  -- Commentary --
  ----------------

  use({
    "b3nj5m1n/kommentary",
    commit = "533d768a140b248443da8346b88e88db704212ab",
    event = "BufWinEnter",
    config = function()
      require("commentary-config")
    end,
  })

  ---------------------
  -- Telescope stuff --
  ---------------------

  use({
    {
      "nvim-telescope/telescope.nvim",
      commit = "10a3310546284faae4ada397a61d68e0a8d0d9f7",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
      -- cmd = "Telescope",
      after = { "toggletasks.nvim", "project.nvim", "telescope-fzf-native.nvim", "telescope-ui-select.nvim" },
      config = function()
        require("telescope-config")
      end,
    },

    -- Project Manager
    {
      "ahmedkhalf/project.nvim",
      commit = "541115e762764bc44d7d3bf501b6e367842d3d4f",
      event = "BufWinEnter",
      config = function()
        require("projects-config")
      end,
    },

    -- Frecency algorithm for telescope
    {
      "nvim-telescope/telescope-frecency.nvim",
      disable = true,
      requires = { "tami5/sqlite.lua" },
    },

    -- FZF Native
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      commit = "6a33ecefa9b3d9ade654f9a7a6396a00c3758ca6",
      run = "make",
      event = "BufWinEnter",
    },

    -- UI select handler
    {
      "nvim-telescope/telescope-ui-select.nvim",
      commit = "62ea5e58c7bbe191297b983a9e7e89420f581369",
      event = "BufWinEnter",
    },
  })

  ---------------------------------------------
  -- Debug Adapter Protocol client and stuff --
  ---------------------------------------------
  use({
    {
      "mfussenegger/nvim-dap",
      commit = "f9cac91213930a5e8e32e1cca063d973b9df25e5",
      event = "BufWinEnter",
    },
    {
      "rcarriga/nvim-dap-ui",
      tag = "v1.1.0",
      after = "nvim-dap",
      config = function()
        require("dap-config")
      end,
    },
  })

  --------------
  -- Whichkey --
  --------------

  use({
    "folke/which-key.nvim",
    commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
    keys = { "<Leader>", "]", "[", "z" },
    config = function()
      require("whichkey-config")
    end,
  })

  ---------
  -- HOP --
  ---------

  use({
    "phaazon/hop.nvim",
    commit = "03675eba34d416dd22ad49b2d0e52b6113b434ad",
    event = "BufWinEnter",
    config = function()
      require("hop").setup()
    end,
  })

  --------------
  -- Gitsigns --
  --------------

  use({
    "lewis6991/gitsigns.nvim",
    commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff",
    event = "BufWinEnter",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns-config")
    end,
  })

  --------------
  -- Terminal --
  --------------

  use({
    "akinsho/toggleterm.nvim",
    commit = "04174e19196ecef43dd159b29d4e6ddb07b80909",
    event = "BufWinEnter",
    config = function()
      require("terminal-config")
    end,
  })

  -----------------
  -- Taks Runner --
  -----------------

  use({
    "jedrzejboczar/toggletasks.nvim",
    commit = "4329ad580799f25c0a923a2d1e71a585ae0bbc48",
    after = { "toggleterm.nvim" },
    requires = {
      "nvim-lua/plenary.nvim",
      "akinsho/toggleterm.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("toggletasks-config")
    end,
  })

  ------------------
  -- Notification --
  ------------------

  use({
    "rcarriga/nvim-notify",
    commit = "7caeaaef257ecbe95473ec79e5a82757b544f1fd",
    event = "BufWinEnter",
    config = function()
      require("notification-config")
    end,
  })

  ---------------------
  -- Session Manager --
  ---------------------

  use({
    "Shatur/neovim-session-manager",
    commit = "9652b392805dfd497877342e54c5a71be7907daf",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufWinEnter",
    config = function()
      require("session-manager-config")
    end,
  })

  ---------------------
  -- Color and stuff --
  ---------------------

  use({
    {
      "norcalli/nvim-colorizer.lua",
      event = "BufWinEnter",
      config = function()
        require("colorizer-config")
      end,
    },
    {
      "ziontee113/color-picker.nvim",
      event = "BufWinEnter",
      config = function()
        require("color-picker-config")
      end,
    },
    {
      "max397574/colortils.nvim",
      disable = true,
      event = "BufWinEnter",
      config = function()
        require("colortils-config")
      end,
    },
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

  use({
    "andweeb/presence.nvim",
    commit = "660bd8815ef8da029fa0058f76ac7fa2ca8f9ec7",
    event = "BufWinEnter",
    config = {
      function()
        require("discord-presence-config")
      end,
    },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
