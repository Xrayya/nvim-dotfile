local autocompletion = {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      luasnip.filetype_extend("php", { "html" })

      luasnip.filetype_extend("typescript", { "tsdoc" })
      luasnip.filetype_extend("javascript", { "jsdoc" })
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

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("i", "<M-l>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
      map("i", "<M-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
      map("s", "<M-l>", "<cmd>lua require('luasnip').jump(1)<cr>", opts)
      map("s", "<M-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
      map("i", "<M-L>", "<cmd>lua require('luasnip').change_choice(1)<cr>", opts)
      map("i", "<M-H>", "<cmd>lua require('luasnip').change_choice(-1)<cr>", opts)
      map("s", "<M-L>", "<cmd>lua require('luasnip').change_choice(1)<cr>", opts)
      map("s", "<M-H>", "<cmd>lua require('luasnip').change_choice(-1)<cr>", opts)
    end,
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
        enabled = true,
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
    },
    config = function()
      vim.g.completeopt = "menu,menuone,noselect"

      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      local luasnip = require("luasnip")
      local icons = LOAD_UTIL("icons")

      vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#bb5df3" })

      require("luasnip.loaders.from_vscode").lazy_load({
        exclude = { "java" },
      })

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      vim.keymap.set("i", "<M-Space>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true })

      cmp.setup({
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

            vim_item.menu = ({
              buffer = icons.ui.Buffer,
              path = icons.ui.Path,
              nvim_lsp = icons.ui.LSP,
              luasnip = icons.misc.Luasnip,
              cmp_tabnine = icons.ui.HighPriority,
              cmdline = icons.ui.Terminal,
            })[entry.source.name]

            local labelDetails = (entry.completion_item.labelDetails or {})
            vim_item.menu = vim_item.menu
                .. " "
                .. (labelDetails.detail or "")
                .. " "
                .. (labelDetails.description or "")

            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sorting = {
          comparators = {
            compare.offset,
            compare.exact,
            compare.score,
            require("cmp_tabnine.compare"),
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
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
            elseif has_words_before() then
              fallback()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "cmp_tabnine" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

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

      -- integration with cmp-autopairs
      cmp.event:on(
        "confirm_done",
        require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } })
      )
    end,
  },
}

return autocompletion
