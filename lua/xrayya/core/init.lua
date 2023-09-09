local load = function (module)
  require("xrayya." .. module)
end

load("core.options")
load("core.keymaps")
load("utils.global-functions")
load("core.plugin-loader")
