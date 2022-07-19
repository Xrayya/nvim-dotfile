local conditions = require("lualine-config.custom-lualine.my-lualine.condition")
local colors = require("lualine-config.custom-lualine.my-lualine.colors")

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local theme = require("lualine.themes." .. vim.g.colors_name)
local mode = {
  n = theme.normal,
  i = theme.insert,
  c = theme.command,
  v = theme.visual,
  V = theme.visual,
  [""] = theme.visual,
  R = theme.replace,
}

return {
  mode = {
    function()
      -- stylua: ignore start
      local alias = {
        ['n']     = '| N ',
        ['no']    = 'O-PENDING',
        ['nov']   = 'O-PENDING',
        ['noV']   = 'O-PENDING',
        ['no\22'] = 'O-PENDING',
        ['niI']   = '| N ',
        ['niR']   = '| N ',
        ['niV']   = '| N ',
        ['nt']    = '| N ',
        ['v']     = '|VIS',
        ['vs']    = '|VIS',
        ['V']     = '|V-L',
        ['Vs']    = '|V-L',
        ['\22']   = '|V-B',
        ['\22s']  = '|V-B',
        ['s']     = '|SEL',
        ['S']     = '|S-L',
        ['\19']   = '|S-B',
        ['i']     = '|INS',
        ['ic']    = '|CMP',
        ['ix']    = '|CMP',
        ['R']     = '﯒|REP',
        ['Rc']    = '﯒|REP',
        ['Rx']    = '﯒|REP',
        ['Rv']    = '﯒|R&V',
        ['Rvc']   = '﯒|R&V',
        ['Rvx']   = '﯒|R&V',
        ['c']     = 'ﲵ|CMD',
        ['C']     = 'ﲵ|CMD',
        ['cv']    = 'EX',
        ['ce']    = 'EX',
        ['r']     = 'HIT-ENTER',
        ['rm']    = '--MORE',
        ['r?']    = ':CONFIRM',
        ['!']     = 'SHELL',
        ['t']     = '|TERMINAL',
      }
      -- stylua: ignore start
      local mode_code = vim.api.nvim_get_mode().mode
      if alias[mode_code] == nil then
        return mode_code
      end
      return alias[mode_code]
    end,
    padding = { left = 1, right = 1 },
    color = {},
    cond = nil,
  },
  branch = {
    "b:gitsigns_head",
    icon = "",
    padding = { left = 2, right = 2 },
    color = function()
      local mode_code = vim.api.nvim_get_mode().mode
      if mode[mode_code] == nil then
        return { bg = mode.n.b.bg, gui = "bold" }
      end
      return { bg = mode[vim.fn.mode()].b.bg, gui = "bold" }
    end,
    cond = function()
      return vim.opt.columns._value > 100
    end,
  },
  filename = {
    "filename",
    color = function()
      local mode_code = vim.api.nvim_get_mode().mode
      if mode[mode_code] == nil then
        return { fg = mode.n.a.bg }
      end
      return { fg = mode[vim.fn.mode()].a.bg }
    end,
    cond = conditions.buffer_not_empty,
    symbols = {
      modified = " ●",
      readonly = " ",
      unnamed = " ",
    },
    padding = { left = 0, right = 2 },
  },
  filesize = {
    "filesize",
    color = function()
      local mode_code = vim.api.nvim_get_mode().mode
      if mode[mode_code] == nil then
        return { fg = mode.n.a.bg }
      end
      return { fg = mode[vim.fn.mode()].a.bg }
    end,
    padding = { left = 0, right = 2 },
    cond = function()
      return vim.opt.columns._value > 115
    end,
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
    },
    padding = { left = 0, right = 2 },
    color = function()
      local mode_code = vim.api.nvim_get_mode().mode
      if mode[mode_code] == nil then
        return { bg = mode.n.b.bg }
      end
      return { bg = mode[vim.fn.mode()].b.bg }
    end,
    cond = function()
      return vim.opt.columns._value > 100
    end,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    color = function()
      local mode_code = vim.api.nvim_get_mode().mode
      if mode[mode_code] == nil then
        return { bg = mode.n.b.bg }
      end
      return { bg = mode[vim.fn.mode()].b.bg }
    end,
    padding = { left = 2, right = 0 },
    update_in_insert = true,
    always_visible = false,
    cond = nil,
  },
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return ""
      end
      return ""
    end,
    padding = { left = 2, right = 1 },
    color = { fg = colors.green },
    cond = function()
      return vim.opt.columns._value > 120
    end,
  },
  lsp = {
    function(msg)
      msg = msg or "LS Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "LS Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- null-ls register
      local null_ls_list_registered = function(filetype, method)
        local null_ls_sources =
          require("functions").notifreq("null-ls.sources", "lualine-config.components.lsp", "error")
        if null_ls_sources == nil then
          return {}
        end

        local available_sources = null_ls_sources.get_available(filetype)
        local registered_providers = {}
        for _, source in ipairs(available_sources) do
          for mthd in pairs(source.methods) do
            registered_providers[mthd] = registered_providers[mthd] or {}
            table.insert(registered_providers[mthd], source.name)
          end
        end

        return registered_providers[method] or {}
      end

      local null_ls = require("functions").notifreq("null-ls", "lualine-config.components.lsp", "error")
      if null_ls ~= nil then
        -- add formatter
        local supported_formatters = null_ls_list_registered(buf_ft, null_ls.methods.FORMATTING)
        vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        local supported_linters = null_ls_list_registered(buf_ft, null_ls.methods.DIAGNOSTICS)
        vim.list_extend(buf_client_names, supported_linters)
      end

      return table.concat(buf_client_names, ", ")
    end,
    icon = "",
    color = function()
      local mode_code = vim.api.nvim_get_mode().mode
      if mode[mode_code] == nil then
        return { bg = mode.n.b.bg, gui = "bold" }
      end
      return { bg = mode[vim.fn.mode()].b.bg, gui = "bold" }
    end,
    padding = { left = 2, right = 2 },
    cond = nil,
  },
  spaces = {
    function()
      if not vim.api.nvim_buf_get_option(0, "expandtab") then
        return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop")
      end
      local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
      if size == 0 then
        size = vim.api.nvim_buf_get_option(0, "tabstop")
      end
      return "Spaces: " .. size
    end,
    color = {},
    cond = function()
      return vim.opt.columns._value > 125
    end,
    padding = { left = 1, right = 1 },
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = function()
      return vim.opt.columns._value > 140
    end,
  },
  fileformat = {
    "fileformat",
    color = {},
    cond = function()
      return vim.opt.columns._value > 135
    end,
  },
  filetype = {
    "filetype",
    icon_only = true,
    color = {},
    padding = { left = 2, right = 1 },
    cond = nil,
  },
  location = {
    "location",
    color = {},
    padding = { left = 1, right = 0 },
    cond = function ()
      return vim.opt.columns._value > 75
    end,
  },
  progress = {
    "progress",
    color = {},
    cond = function()
      return vim.opt.columns._value > 70
    end,
  },
  scrollbar = {
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 1, right = 0 },
    color = { fg = colors.yellow, bg = colors.bg },
    cond = function()
      return vim.opt.columns._value > 70
    end,
  },
}
