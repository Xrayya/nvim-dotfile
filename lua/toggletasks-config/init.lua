local toggletasks = require("functions").notifreq("toggletasks", "toggletasks-config", "error")
if toggletasks == nil then
  return
end

toggletasks.setup()
