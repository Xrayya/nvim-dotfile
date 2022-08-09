local toggletasks = NOTIF_REQ("toggletasks", "toggletasks-config", "error")
if toggletasks == nil then
  return
end

toggletasks.setup()
