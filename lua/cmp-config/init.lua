vim.g.completeopt="menu,menuone,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
local lspkind = require('lspkind')

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  luasnip = "[LuaSnip]",
  vsnip = "[VSnip]",
  ultisnips = "[UltiSnips]",
  snippy = "[Snippy]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  calc = "[Calc]",
  latex_symbols = "[Latex]",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },

  -- Lspkind format on suggestion
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      --preset = 'codicons',
      menu = (source_mapping),
    })
		-- format = function(entry, vim_item)
		-- 	vim_item.kind = lspkind.presets.default[vim_item.kind]
		-- 	local menu = source_mapping[entry.source.name]
		-- 	if entry.source.name == 'cmp_tabnine' then
		-- 		if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
		-- 			menu = entry.completion_item.data.detail .. ' ' .. menu
		-- 		end
		-- 		vim_item.kind = ''
  --     else
  --       lspkind.cmp_format({
  --         with_text = true,
  --         menu = (source_mapping),
  --       })
		-- 	end
		-- 	vim_item.menu = menu
		-- 	return vim_item
		-- end
  },

  mapping = {
    ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-2), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(2), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    { name = 'cmp_tabnine'},
  }, {
    { name = 'buffer' },
    { name = 'calc' },
  }),

  documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  }, {
    { name = 'buffer'}
  })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Integration with autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
