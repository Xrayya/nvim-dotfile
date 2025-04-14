local load = function(module)
  require("xrayya." .. module)
end

load("utils.global-functions")
load("config.options")
load("config.keymaps")
load("config.plugin-loader")
load("autocommands")
load( "user-commands")
