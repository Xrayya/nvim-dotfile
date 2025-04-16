---@type LazySpec
return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load({
        exclude = { "java" },
      })

      luasnip.filetype_extend("php", { "html" })
      luasnip.filetype_extend("blade", { "html" })
      luasnip.filetype_extend("javascriptreact", { "html", "jsdoc" })
      luasnip.filetype_extend("typescriptreact", { "html", "tsdoc" })

      luasnip.filetype_extend("javascript", { "jsdoc" })
      luasnip.filetype_extend("typescript", { "tsdoc" })
      luasnip.filetype_extend("lua", { "luadoc" })
      luasnip.filetype_extend("python", { "pydoc" })
      luasnip.filetype_extend("rust", { "rustdoc" })
      luasnip.filetype_extend("cs", { "csharpdoc" })
      luasnip.filetype_extend("c", { "cdoc" })
      luasnip.filetype_extend("cpp", { "cppdoc" })
      luasnip.filetype_extend("php", { "phpdoc" })
      luasnip.filetype_extend("kotlin", { "kdoc" })
      luasnip.filetype_extend("ruby", { "rdoc" })
      luasnip.filetype_extend("sh", { "shelldoc" })
    end,
    keys = {
      {
        "<M-l>",
        function()
          require("luasnip").jump(1)
        end,
        mode = { "i", "s" },
        desc = "Jump forward",
      },
      {
        "<M-h>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
        desc = "Jump backward",
      },
      {
        "<M-L>",
        function()
          require("luasnip").change_choice(1)
        end,
        mode = { "i", "s" },
        desc = "Change choice forward",
      },
      {
        "<M-H>",
        function()
          require("luasnip").change_choice(-1)
        end,
        mode = { "i", "s" },
        desc = "Change choice backward",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
      {
        "tzachar/cmp-tabnine",
        enabled = false,
        build = vim.fn.has("win32") > 0 and "powershell ./install.ps1" or "./install.sh",
      },
      {
        "L3MON4D3/cmp-luasnip-choice",
        config = function()
          require("cmp_luasnip_choice").setup({
            auto_open = true,
          })
        end,
      },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
      "micangl/cmp-vimtex",
      "folke/lazydev.nvim",
    },
    init = function()
      vim.g.completeopt = "menu,menuone,noselect,popup"
    end,
    opts = function()
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      local icons = LOAD_UTIL("icons")

      vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#bb5df3" })

      ---@type cmp.ConfigSchema
      return {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = icons.kind[vim_item.kind]

            if entry.source.name == "cmp_tabnine" then
              vim_item.kind = icons.misc.Tabnine
              vim_item.kind_hl_group = "CmpItemKindTabNine"
            end

            -- vim.notify(vim.inspect(entry.source.source))

            vim_item.menu = ({
              buffer = icons.ui.Buffer,
              path = icons.ui.Path,
              nvim_lsp = icons.ui.LSP,
              luasnip = icons.misc.Luasnip,
              cmp_tabnine = icons.ui.HighPriority,
              cmdline = icons.ui.Terminal,
              vimtex = icons.ui.Latex,
              ["vim-dadbod-completion"] = icons.ui.Database,
            })[entry.source.name]

            if entry.source.name == "nvim_lsp" and entry.source.source.client._log_prefix then
              vim_item.menu = vim_item.menu
                .. " "
                .. string.format("[%s]", entry.source.source.client._log_prefix:match("LSP%[(.-)%]"))
            end

            local labelDetails = (entry.completion_item.labelDetails or {})

            if entry.source.name == "vim-dadbod-completion" then
              labelDetails.description = ""
            end

            vim_item.menu = string.format(
              "%s %s %s",
              (vim_item.menu or ""),
              (labelDetails.detail or ""),
              (labelDetails.description or "")
            )

            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        ---@diagnostic disable-next-line: missing-fields
        sorting = {
          comparators = {
            compare.offset,
            compare.exact,
            compare.score,
            -- require("cmp_tabnine.compare"),
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = function(fallback)
            if not cmp.visible() or not cmp.get_selected_entry() then
              fallback()
            else
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
              })
            end
          end,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          },
          { name = "nvim_lsp" },
          { name = "vimtex" },
          { name = "cmp_tabnine" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })

      -- integration with cmp-autopairs
      cmp.event:on(
        "confirm_done",
        require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } })
      )
    end,
  },
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    config = function()
      -- require("CopilotChat.integrations.cmp").setup()

      require("CopilotChat").setup({
        mappings = {
          complete = {
            insert = "",
          },
        },
      })
    end,
  },
}
