local plenary_status_ok, path = pcall(require, "plenary.path")
if not plenary_status_ok then
  vim.notify('session-manager-config: failed to load "plenary.path" module')
  return
end

local session_manager_status_ok, manager = pcall(require, "session_manager")
if not session_manager_status_ok then
  vim.notify('session-manager-config: failed to load "session_manager" module')
  return
end

manager.setup({
  sessions_dir = path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
  path_replacer = "__", -- The character to which the path separator will be replaced for session files.
  colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
})
