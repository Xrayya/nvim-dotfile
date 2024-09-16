local util = require("lspconfig.util")

local root_files = {
  "compile_commands.json",
  "build/compile_commands.json",
  ".ccls",
}

return {
  root_dir = function(fname)
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
  end,
}
