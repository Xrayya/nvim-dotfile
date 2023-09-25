return {
  mode = {
    function()
      -- stylua: ignore start
      local alias = {
        ['n']     = '󰭩  N ',
        ['no']    = 'O-PENDING',
        ['nov']   = 'O-PENDING',
        ['noV']   = 'O-PENDING',
        ['no\22'] = 'O-PENDING',
        ['niI']   = '󰭩  N ',
        ['niR']   = '󰭩  N ',
        ['niV']   = '󰭩  N ',
        ['nt']    = '󰭩  N ',
        ['v']     = '󰩭 VIS',
        ['vs']    = '󰩭 VIS',
        ['V']     = '󰩭 V-L',
        ['Vs']    = '󰩭 V-L',
        ['\22']   = '󰩭 V-B',
        ['\22s']  = '󰩭 V-B',
        ['s']     = '󰩭 SEL',
        ['S']     = '󰩭 S-L',
        ['\19']   = '󰩭 S-B',
        ['i']     = ' INS',
        ['ic']    = ' CMP',
        ['ix']    = ' CMP',
        ['R']     = ' REP',
        ['Rc']    = ' REP',
        ['Rx']    = ' REP',
        ['Rv']    = ' V-R',
        ['Rvc']   = ' V-R',
        ['Rvx']   = ' V-R',
        ['c']     = ' CMD',
        ['C']     = ' CMD',
        ['cv']    = 'EX',
        ['ce']    = 'EX',
        ['r']     = 'HIT-ENTER',
        ['rm']    = '--MORE',
        ['r?']    = ':CONFIRM',
        ['!']     = 'SHELL',
        ['t']     = ' TERMINAL',
      }
      -- stylua: ignore end
      local mode_code = vim.api.nvim_get_mode().mode
      return alias[mode_code] or mode_code
    end,
  },
  branch = {
    "branch",
    icon = ""
  },
  filename = {
    "filename",
    symbols = {
      modified = " ●",
      readonly = " ",
      unnamed = " ",
    },
  },
  filesize = {
    "filesize",
  },
  diff = {
    "diff",
    source = function()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end,
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = "#98be65" },
      modified = { fg = "#ECBE7B" },
      removed = { fg = "#ec5f67" },
    },
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
    update_in_insert = true,
    always_visible = false,
  },
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return ""
      end
      return ""
    end,
    color = { fg = "#98be65" },
  },
  lsp = {
    function(msg)
      msg = msg or "LS Inactive"
      local buf_clients = vim.lsp.get_clients()
      if next(buf_clients) == nil then
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
        local is_ok, null_ls_sources = pcall(require, "null-ls.sources")
        if not is_ok then
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

      local is_ok, null_ls = pcall(require, "null-ls")
      if is_ok then
        -- add formatter
        local supported_formatters = null_ls_list_registered(buf_ft, null_ls.methods.FORMATTING)
        vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        local supported_linters = null_ls_list_registered(buf_ft, null_ls.methods.DIAGNOSTICS)
        vim.list_extend(buf_client_names, supported_linters)
      end

      return table.concat(buf_client_names, ", ")
    end,
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
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
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
    -- icon_only = true,
  },
  location = {
    "location",
  },
  progress = {
    "progress",
  },
}
