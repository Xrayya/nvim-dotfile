local M = {}

local icons = require("icons")

M.winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
}

-- M.navic_lsp_exclude = {
--   "html",
--   "cssls",
--   "emmet_ls",
--   "pylsp",
-- }

M.navic_filetype_exclude = {
  "html",
  "css",
  "scss",
  "less",
  "py",
}

-- M.get_file_tree = function ()
--   if vim.bo.filetype == "alpha" then
--     return " "
--   end
--   local tree = vim.fn.split(vim.fn.expand("%:h"), "\\")
--   local full_tree = " "
--   if tree == "" then
--     return full_tree
--   end
--   for _, folder_name in pairs(tree) do
--     full_tree = full_tree .. "%#NavicText#" .. folder_name .. "%*" .. " " .. "%#NavicSeparator#" .. icons.ui.ChevronRight .. "%*" .. " "
--   end
--   return full_tree
-- end

M.get_filename = function()
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")
  local f = require("user-functions")

  if not f.isempty(filename) then
    local file_icon, file_icon_color =
      require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if f.isempty(file_icon) then
      file_icon = ""
      file_icon_color = ""
    end

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#NavicText#" .. filename .. "%*"
  end
end

-- local excludes_navic = function()
--   local buf_clients = vim.lsp.buf_get_clients()
--   for _, client in ipairs(buf_clients) do
--     if vim.tbl_contains(M.navic_lsp_exclude, client.name) then
--       return true
--     end
--   end
--   return false
-- end

-- local excludes_navic = function()
--   return vim.tbl_contains(M.navic_filetype_exclude, vim.bo.filetype)
-- end

local get_gps = function()
  local gps = NOTIF_REQ("nvim-navic", "winbar", "error")
  if gps == nil then
    return ""
  end

  -- if excludes_navic() then
  --   gps = require("user-functions").notifreq("nvim-gps", "winbar", "error")
  --   if gps == nil then
  --     return ""
  --   end
  -- end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ""
  end

  if not gps.is_available() or gps_location == "error" then
    return ""
  end

  if not require("user-functions").isempty(gps_location) then
    return "%#NavicSeparator#" .. icons.ui.ChevronRight .. "%*" .. " " .. gps_location
  else
    return ""
  end
end

local excludes_winbar = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

M.get_winbar = function()
  if excludes_winbar() then
    return
  end
  local f = require("user-functions")
  local value = M.get_filename()

  local gps_added = false
  if not f.isempty(value) then
    local gps_value = get_gps()
    value = value .. " " .. gps_value
    if not f.isempty(gps_value) then
      gps_added = true
    end
  end

  if not f.isempty(value) and f.get_buf_option("mod") then
    local mod = "%#Function#" .. require("icons").ui.Circle .. "%*"
    if gps_added then
      value = value .. " " .. mod
    else
      value = value .. mod
    end

    -- value = " " .. mod .. " |" .. value
  end

  local num_tabs = #vim.api.nvim_list_tabpages()

  if num_tabs > 1 and not f.isempty(value) then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
  end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then
    return
  end
end

return M
