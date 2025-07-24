_G.Xray = require("xrayya.utils")

---@class xrayvim.config
---@field icons xrayvim.icon
local M = {}

setmetatable(M, {
  __index = function(t, k)
    ---@diagnostic disable-next-line: no-unknown
    t[k] = require("xrayya.config." .. k)
    return t[k]
  end,
})

Xray.config = M

local load = function(module)
  require("xrayya." .. module)
end

load("config.options")
load("config.keymaps")
load("config.plugin-loader")
load("autocommands")
load("user-commands")
