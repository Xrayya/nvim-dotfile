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
      commit = "202312e93869213c574d200a40eafeff4b4caec2",
      requires = "neovim/nvim-lspconfig",
      after = "nvim-lspconfig",
      config = function()
        require("navic-config")
      end,
    },
  })

  -----------------
  -- Indentation --
  -----------------

  use({
    "lukas-reineke/indent-blankline.nvim",
    tag = "v2.20.2",
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
    commit = "52b0c3215271349ed91421b9bb39d61b58d9e5d4",
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
      commit = "a52f078026b27694d2290e34efa61a6e4a690621",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      after = "nvim-lspconfig",
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
    commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31",
    requires = { "kyazdani42/nvim-web-devicons" },
    event = "BufWinEnter",
    config = function()
      -- require'alpha'.setup(require'alpha.themes.startify'.opts)
      require("alpha-config")
    end,
  })

  ---------------------
  -- Package manager --
  ---------------------

  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason-config")
    end,
  })

  ---------------
  -- LSP stuff --
  ---------------

  use({
    {
      "williamboman/mason-lspconfig.nvim",
      after = {
        "mason.nvim",
      },
    },
    {
      "neovim/nvim-lspconfig",
      after = {
        "mason-lspconfig.nvim",
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
      tag = "v5.1.0",
      requires = { { "nvim-lua/plenary.nvim" } },
      after = "nvim-lspconfig",
      config = function()
        require("renamer-config")
      end,
    },

    {
      "rmagatti/goto-preview",
      commit = "a5af27cff485b325f0ef2dcdf55ae51faed05cba",
      after = { "nvim-lspconfig", "telescope.nvim" },
      event = "BufWinEnter",
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("goto-preview-config")
      end,
    },

    -- Java LSP
    {
      "mfussenegger/nvim-jdtls",
      commit = "e9f40e793a16f3cebbd7e864e1ea0c32afa38747",
      ft = "java",
    },

    -- Illuminate
    -- TODO : update this
    {
      "RRethy/vim-illuminate",
      commit = "a2e8476af3f3e993bb0d6477438aad3096512e42",
      event = "BufWinEnter",
      config = function()
        require("illuminate-config")
      end,
    },

    -- Inlay hints
    {
      "lvimuser/lsp-inlayhints.nvim",
      commit = "9bcd6fe25417b7808fe039ab63d4224f2071d24a",
      after = "nvim-lspconfig",
      config = function()
        require("lsp-inlayhints-config")
      end,
    },

    -- LSP lines
    -- {
    --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --   after = "nvim-lspconfig",
    -- },

    -- null-ls
    {
      "jose-elias-alvarez/null-ls.nvim",
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
      commit = "492492e7d50452a9ace8346d31f6d6da40439f0e",
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
      tag = "v0.0.1",
      after = { "nvim-autopairs", "LuaSnip", "friendly-snippets" },
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
      commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1",
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
    {
      "rcarriga/cmp-dap",
      disable = false,
      commit = "e21f0e5d188ee428f8acab1af21839af391607a4",
      after = { "nvim-cmp", "nvim-dap" },
    },
    {
      "hrsh7th/cmp-cmdline",
      commit = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e",
      after = {"nvim-cmp", "cmp-buffer", "cmp-path"},
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
    -- vsnip
    {
      "hrsh7th/vim-vsnip",
      disable = true,
      commit = "8f199ef690ed26dcbb8973d9a6760d1332449ac9",
      event = "BufWinEnter",
    },
    {
      "hrsh7th/cmp-vsnip",
      disable = true,
      commit = "0abfa1860f5e095a07c477da940cfcb0d273b700",
      after = "nvim-cmp",
    },

    -- luasnip
    {
      "L3MON4D3/LuaSnip",
      tag = "v1.0.0",
      event = "BufWinEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
      after = "nvim-cmp",
    },

    -- snippets library
    {
      "rafamadriz/friendly-snippets",
      event = "BufWinEnter",
    },
  })

  ---------------------
  -- Diagnostic list --
  ---------------------

  use({
    "folke/trouble.nvim",
    commit = "929315ea5f146f1ce0e784c76c943ece6f36d786",
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
    commit = "6a3ed24c5631da7a5d418bced57c16b32af7747c",
    config = function()
      require("symbols-outline-config")
    end,
  })

  ----------------
  -- Commentary --
  ----------------

  use({
    "numToStr/Comment.nvim",
    commit = "30d23aa2e1ba204a74d5dfb99777e9acbe9dd2d6",
    event = "BufWinEnter",
    config = function()
      require("commentary-config")
    end,
  })

  ------------
  -- Tabout --
  ------------

  -- doesn't seem to work if you also use vim-vsnip
  use({
    "abecodes/tabout.nvim",
    disable = false,
    commit = "be655cc7ce0f5d6d24eeaf8b36e82693fd2facca",
    requires = { "nvim-treesitter" },
    after = {"nvim-cmp", "nvim-treesitter"},
    config = function()
      require("tabout-config")
    end,
  })

  ---------------------
  -- Telescope stuff --
  ---------------------

  use({
    {
      "nvim-telescope/telescope.nvim",
      commit = "30e2dc5232d0dd63709ef8b44a5d6184005e8602",
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
      commit = "628de7e433dd503e782831fe150bb750e56e55d6",
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
      commit = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90",
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

    -- DAP client
    {
      "mfussenegger/nvim-dap",
      commit = "3c3e0a82457e2279563510ca16ae71279687c19c",
      event = "BufWinEnter",
    },

    -- UI views vscode-like for nvim-dap
    {
      "rcarriga/nvim-dap-ui",
      tag = "v1.6.0",
      after = "nvim-dap",
      config = function()
        require("dap-config")
      end,
    },

    -- Show virtual text for nvim-dap
    {
      "theHamsta/nvim-dap-virtual-text",
      commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4",
      after = "nvim-dap",
      config = function()
        require("dap-virtual-text-config")
      end,
    },
  })

  --------------
  -- Whichkey --
  --------------

  use({
    "folke/which-key.nvim",
    commit = "6885b669523ff4238de99a7c653d47b081b5506d",
    event = "BufWinEnter",
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
      require("hop-config")
    end,
  })

  --------------
  -- Gitsigns --
  --------------

  use({
    "lewis6991/gitsigns.nvim",
    commit = "231fa923fbc2797eef92b24860ab882cebf645b2",
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
    commit = "5ea823359b450bcf9a784f73734fd2d52e9de0ec",
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
    commit = "f9c6f819ef44a78a8ad61855ec2913f992f9b989",
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
    tag = "v3.4.0",
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
    commit = "43440e71f9b06a5df1acacf84c232901c7562016",
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
      "NvChad/nvim-colorizer.lua",
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

  ----------
  -- Numb --
  ----------

  use({
    "nacro90/numb.nvim",
    event = "BufWinEnter",
    config = function ()
      require("numb-config")
    end
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
    commit = "03e09d3f9be8b3d9481d97d957c62d28b5850ab6",
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
