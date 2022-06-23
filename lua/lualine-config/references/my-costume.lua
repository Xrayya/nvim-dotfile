-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  none     = 'None',
  white    = '#ffffff',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  black    = '#080808',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ff5189',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  extensions = {'nvim-tree'},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-------------------------------
-- Icons & nvim modes colors --
-------------------------------

-- Modes color
local mode_color = {
  -- n = colors.red,
  -- i = colors.green,
  -- v = colors.blue,
  -- [''] = colors.blue,
  -- V = colors.blue,
  -- c = colors.magenta,
  -- no = colors.red,
  -- s = colors.orange,
  -- S = colors.orange,
  -- [''] = colors.orange,
  -- ic = colors.yellow,
  -- R = colors.violet,
  -- Rv = colors.violet,
  -- cv = colors.red,
  -- ce = colors.red,
  -- r = colors.cyan,
  -- rm = colors.cyan,
  -- ['r?'] = colors.cyan,
  -- ['!'] = colors.red,
  -- t = colors.red,
	c  = colors.magenta, ['!'] = colors.red,
	i  = colors.green,   ic    = colors.yellow, ix     = colors.yellow,
	n  = colors.blue,
	no = colors.blue,    nov   = colors.blue,   noV    = colors.blue,
	r  = colors.cyan,    rm    = colors.cyan,   ['r?'] = colors.cyan,
	R  = colors.red,  Rv    = colors.red,
	s  = colors.orange,  S     = colors.orange, [''] = colors.orange,
	t  = colors.violet,
	v  = colors.violet,     V     = colors.violet,    [''] = colors.violet,
}
-- vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)

------------------
-- Start Insert --
------------------

ins_left {
  function()
    vim.api.nvim_command('hi! BorderIcon guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.none)
    return ''
  end,
  color = 'BorderIcon', -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before and after this
}

ins_left {
  -- mode component
  function()
    local modeIcon = {
      n      = ' ',
      i      = ' ',
      c      = 'ﲵ ',
      V      = ' ',
      [''] = ' ',
      v      = ' ',
      C      = 'ﲵ ',
      R      = '﯒ ',
      t      = ' ',
    }
    vim.api.nvim_command('hi! IconMode guifg=' .. colors.bg .. ' guibg=' .. mode_color[vim.fn.mode()])
    return modeIcon[vim.fn.mode()]
  end,
  color = 'IconMode',
  padding = { left = 0, right = 0 },
}

ins_left {
  function ()
    local alias = {
      n      = ' NORMAL ',
      i      = '  INS   ',
      c      = '  CMD   ',
      V      = ' V-LINE ',
      [''] = 'V-BLOCK ',
      v      = '  VIS   ',
      C      = '  CMD   ',
      ['r?'] = ':CONFIRM',
      rm     = ' --MORE ',
      R      = 'REPLACE ',
      Rv     = '   R&V  ',
      s      = ' SELECT ',
      S      = ' SELECT ' ,
      ['r']  = 'HIT-ENTER',
      [''] = ' SELECT ',
      t      = '  T     ',
      ['!']  = '   SH   ',
    }
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return alias[vim.fn.mode()]
  end,
  color = 'LualineMode',
  padding = { left = 0, right = 0},
}

ins_left {
  function()
    vim.api.nvim_command('hi! LualineSeparator guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return ''
  end,
  color = 'LualineMode',
  padding = { left = 0 },
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.white},
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_lsp' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- ins_left {
--   -- Lsp server name .
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' LSP:',
--   color = { fg = '#ffffff', gui = 'bold' },
-- }

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green, bg = colors.bg },
    modified = { fg = colors.orange, bg = colors.bg },
    removed = { fg = colors.red, bg = colors.bg },
  },
  cond = conditions.hide_in_width,
  padding = { right = 1 }
}

ins_right {
  function()
    return ''
  end,
  color = 'BorderIcon',
  padding = { left = 0 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
