local load = function(module)
  require("xrayya." .. module)
end

load("utils.global-functions")
load("core.options")
load("core.keymaps")
load("core.plugin-loader")
load("autocommands")
