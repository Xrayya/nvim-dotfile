vim.api.nvim_create_user_command("PlanumlCompile", function(args)
  local input_file = vim.fn.expand("%:p")
  local output_file = vim.fn.expand("%:p:r") .. ".png"

  local cmd = string.format('plantuml "%s"', input_file)
  local result = vim.fn.system(cmd)

  if string.find(result, "Error") or string.find(result, "Warning") then
    vim.notify(result, vim.log.levels.ERROR, {
      title = "PlantUML Compilation",
    })
  else
    vim.notify("Compiling done", vim.log.levels.INFO, {
      title = "PlantUML Compilation",
    })
    vim.notify("Output file: " .. output_file, vim.log.levels.INFO, {
      title = "PlantUML Compilation",
    })
    vim.fn.system(string.format('xdg-open "%s"', output_file))
  end
end, {})

local plantuml = {
  "javiorfo/nvim-soil",
  enabled = false,
  lazy = true,
  ft = "plantuml",
  opts = {
    image = {
      darkmode = false,
      execute_to_open = function(img)
        return string.format('xdg-open "%s"', img)
      end,
    },
  },
}

return plantuml
