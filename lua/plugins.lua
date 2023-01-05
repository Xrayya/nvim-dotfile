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
        require("xrayya.treesitter")
      end,
    },

    -- Autopair
    {
      "windwp/nvim-autopairs",
      after = "nvim-treesitter",
      config = function()
        require("xrayya.autopairs")
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
    },

    -- Commentstring
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      after = "nvim-treesitter",
    },

    -- Endwise
    {
      "RRethy/nvim-treesitter-endwise",
      after = "nvim-treesitter",
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
      require("xrayya.indent-blankline")
    end,
  })

  --------------
  -- Nvimtree --
  --------------

  use({
    "kyazdani42/nvim-tree.lua",
    commit = "bac962caf472a4404ed3ce1ba2fcaf32f8002951",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = "NvimTreeToggle",
    config = function()
      require("xrayya.nvim-tree")
    end,
  })

  -------------------------------
  -- Statusline and buffer manager --
  -------------------------------

  use({
    {
      "nvim-lualine/lualine.nvim",
      commit = "abb03129e0b0b7f4c992b1b4c98245cd4422e7d5",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      after = "nvim-lspconfig",
      config = function()
        require("xrayya.lualine")
      end,
    },
    {
      "akinsho/bufferline.nvim",
      disable = true,
      commit = "68839d62785edfb4ff7a7b3c1e9f4b64d55749e8",
      requires = "kyazdani42/nvim-web-devicons",
      event = "BufWinEnter",
      config = function()
        require("xrayya.bufferline")
      end,
    },
    {
      "ghillb/cybu.nvim",
      branch = "main",
      requires = { "kyazdani42/nvim-web-devicons" },
      event = "BufWinEnter",
      config = function()
        require("xrayya.cybu")
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
      require("xrayya.alpha")
    end,
  })

  ---------------------
  -- Package manager --
  ---------------------

  use({
    "williamboman/mason.nvim",
    config = function()
      require("xrayya.mason")
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
        "typescript.nvim",
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
      commit = "778cf600684a87eb36f9bb469346cfa8d5384a76",
      after = { "nvim-lspconfig", "telescope.nvim" },
      event = "BufWinEnter",
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("xrayya.goto-preview")
      end,
    },

    -- Java LSP
    {
      "mfussenegger/nvim-jdtls",
      commit = "0422245fdef57aa4eddba3d99aee1afaaf425da7",
      ft = "java",
    },

    -- Typescript LSP
    {
      "jose-elias-alvarez/typescript.nvim",
      commit = "f66d4472606cb24615dfb7dbc6557e779d177624",
      event = "BufWinEnter",
    },

    -- Illuminate
    -- NOTE: keep this one outdated for now, hard to configure the highlight
    -- FIXME: need help
    {
      "RRethy/vim-illuminate",
      commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be",
      event = "BufWinEnter",
      config = function()
        require("xrayya.illuminate")
      end,
    },

    -- Inlay hints
    {
      "lvimuser/lsp-inlayhints.nvim",
      disable = true,
      commit = "439b4811276a149e3fccb226cc9a43ff2fb0e33b",
      after = "nvim-lspconfig",
      -- config = function()
      --   require("lsp-inlayhints-config")
      -- end,
    },

    {
      "ofirgall/inlay-hints.nvim",
      commit = "d26b6158349e311731ce2fbd5052ca45f8d8d792",
      after = "nvim-lspconfig",
      config = function()
        require("lsp-inlayhints-config")
      end,
    },

    -- LSP lines
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      as = "lsp_lines.nvim",
      after = "nvim-lspconfig",
      config = function()
        require("xrayya.lsp-lines")
      end,
    },

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
      commit = "1097a86db8ba38e390850dc4035a03ed234a4673",
      event = "BufWinEnter",
      config = function()
        require("xrayya.fidget")
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
        require("xrayya.cmp")
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
      commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-path",
      commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-calc",
      commit = "f7efc20768603bd9f9ae0ed073b1c129f63eb312",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      commit = "d2768cb1b83de649d57d967085fe73c5e01f8fd7",
      after = "nvim-cmp",
    },
    {
      "rcarriga/cmp-dap",
      disable = true,
      commit = "a67883cfe574923d3414035ba16159c0ed6d8dcf",
      after = { "nvim-cmp", "nvim-dap" },
    },
    {
      "hrsh7th/cmp-cmdline",
      commit = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e",
      after = { "nvim-cmp", "cmp-buffer", "cmp-path" },
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
    -- luasnip
    {
      "L3MON4D3/LuaSnip",
      tag = "v1.1.0",
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
    commit = "ed65f84abc4a1e5d8f368d7e02601fc0357ea15e",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = { "Trouble", "TroubleToggle" },
    config = function()
      require("trouble").setup({})
    end,
  })

  ------------------
  -- Todo-Comments --
  ------------------
  use({
    "folke/todo-comments.nvim",
    commit = "61240662fd9ffa4a546db57abcc50b97f6fab27b",
    requires = "nvim-lua/plenary.nvim",
    event = "BufWinEnter",
    config = function()
      require("xrayya.todo-comments")
    end,
  })

  ---------------------
  -- Symbols outline --
  ---------------------

  use({
    "simrat39/symbols-outline.nvim",
    commit = "6a3ed24c5631da7a5d418bced57c16b32af7747c",
    config = function()
      require("xrayya.symbols-outline")
    end,
  })

  -------------
  -- Context --
  -------------

  use({
    "SmiteshP/nvim-navic",
    commit = "132b273773768b36e9ecab2138b82234a9faf5ed",
    requires = "neovim/nvim-lspconfig",
    after = "nvim-lspconfig",
    config = function()
      require("xrayya.navic")
    end,
  })

  ----------------
  -- Commentary --
  ----------------

  use({
    "numToStr/Comment.nvim",
    commit = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6",
    event = "BufWinEnter",
    config = function()
      require("xrayya.commentary")
    end,
  })

  ------------
  -- Tabout --
  ------------

  -- doesn't seem to work if you also use vim-vsnip
  use({
    "abecodes/tabout.nvim",
    commit = "c37ce26f316a2df693140450b8def41e89c0f57e",
    requires = { "nvim-treesitter" },
    after = { "nvim-cmp", "nvim-treesitter" },
    config = function()
      require("xrayya.tabout")
    end,
  })

  ---------------------
  -- Telescope stuff --
  ---------------------

  use({
    {
      "nvim-telescope/telescope.nvim",
      commit = "f174a0367b4fc7cb17710d867e25ea792311c418",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
      -- cmd = "Telescope",
      after = { "toggletasks.nvim", "project.nvim", "telescope-fzf-native.nvim", "telescope-ui-select.nvim" },
      config = function()
        require("xrayya.telescope")
      end,
    },

    -- Project Manager
    {
      "ahmedkhalf/project.nvim",
      commit = "628de7e433dd503e782831fe150bb750e56e55d6",
      event = "BufWinEnter",
      config = function()
        require("xrayya.projects")
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
      tag = "0.3.0",
      event = "BufWinEnter",
    },

    -- UI views vscode-like for nvim-dap
    {
      "rcarriga/nvim-dap-ui",
      tag = "v2.1.1",
      after = "nvim-dap",
    },

    -- Bridge for mason.nvim and nvim-dap
    {
      "jay-babu/mason-nvim-dap.nvim",
      commit = "d6cb770928b5cb9a6e3880d6bbb58858c1deeb18",
      after = {"nvim-dap", "nvim-dap-ui"},
      config = function()
        require("xrayya.dap")
      end,
    },

    -- Show virtual text for nvim-dap
    {
      "theHamsta/nvim-dap-virtual-text",
      commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4",
      after = "nvim-dap",
      config = function()
        require("xrayya.dap-virtual-text")
      end,
    },
  })

  --------------
  -- Whichkey --
  --------------

  use({
    "folke/which-key.nvim",
    commit = "a03265ed97ef52680732809f274ae18ac4a61a33",
    event = "BufWinEnter",
    config = function()
      require("xrayya.whichkey")
    end,
  })

  ---------
  -- HOP --
  ---------

  use({
    "phaazon/hop.nvim",
    commit = "6591b3656b75ff313cc38dc662a7ee8f75f1c165",
    event = "BufWinEnter",
    config = function()
      require("xrayya.hop")
    end,
  })

  --------------
  -- Gitsigns --
  --------------

  use({
    "lewis6991/gitsigns.nvim",
    commit = "21ab05c2629ef613b1c3452d12469f936855648b",
    event = "BufWinEnter",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("xrayya.gitsigns")
    end,
  })

  --------------
  -- Terminal --
  --------------

  use({
    "akinsho/toggleterm.nvim",
    commit = "8f302c9a05ff53fc3f891cbf09c5f959b10392a3",
    event = "BufWinEnter",
    config = function()
      require("xrayya.toggleterm")
    end,
  })

  -----------------
  -- Taks Runner --
  -----------------

  use({
    "jedrzejboczar/toggletasks.nvim",
    commit = "b22c85f8a5d93a85196e0e46126f3af972832f7a",
    after = { "toggleterm.nvim" },
    requires = {
      "nvim-lua/plenary.nvim",
      "akinsho/toggleterm.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("xrayya.toggletasks")
    end,
  })

  ------------------
  -- Notification --
  ------------------

  use({
    "rcarriga/nvim-notify",
    tag = "v3.7.2",
    event = "BufWinEnter",
    config = function()
      require("xrayya.notify")
    end,
  })

  ---------------------
  -- Session Manager --
  ---------------------

  use({
    "Shatur/neovim-session-manager",
    commit = "4005dac93f5cd1257792259ef4df6af0e3afc213",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufWinEnter",
    config = function()
      require("xrayya.session-manager")
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
        require("xrayya.colorizer")
      end,
    },
    {
      "ziontee113/color-picker.nvim",
      event = "BufWinEnter",
      config = function()
        require("xrayya.color-picker")
      end,
    },
    {
      "max397574/colortils.nvim",
      disable = true,
      event = "BufWinEnter",
      config = function()
        require("xrayya.colortils")
      end,
    },
  })

  ----------
  -- Numb --
  ----------

  use({
    "nacro90/numb.nvim",
    event = "BufWinEnter",
    config = function()
      require("xrayya.numb")
    end,
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
    commit = "c1c54758824cbecd4e18065d37191f7666fdd097",
    event = "BufWinEnter",
    config = {
      function()
        require("xrayya.discord-presence")
      end,
    },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
