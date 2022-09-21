local toggletasks = NOTIF_REQ("toggletasks", "toggletasks-config", "error")
if toggletasks == nil then
  return
end

toggletasks.setup({
  scan = {
    global_cwd = true, -- vim.fn.getcwd(-1, -1)
    tab_cwd = true, -- vim.fn.getcwd(-1, tab)
    win_cwd = true, -- vim.fn.getcwd(win)
    lsp_root = true, -- root_dir for first LSP available for the buffer
    dirs = {}, -- explicit list of directories to search or function(win): dirs
    rtp = true, -- scan directories in &runtimepath
    rtp_ftplugin = true, -- scan in &rtp by filetype, e.g. ftplugin/c/toggletasks.json
  },
})
