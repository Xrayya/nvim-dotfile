vim.api.nvim_create_user_command(
  "PlanumlCompile",
  function()
    local input_file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:p:r") .. ".png"

    vim.uv.spawn(
      "plantuml",
      ---@diagnostic disable-next-line: missing-fields
      {
        args = { input_file },
      },
      vim.schedule_wrap(function(code, _)
        if code == 0 then
          vim.notify("Compiling done", vim.log.levels.INFO, {
            title = "PlantUML Compilation",
          })
          vim.notify("Output file: " .. output_file, vim.log.levels.INFO, {
            title = "PlantUML Compilation",
          })
          vim.fn.system(string.format('xdg-open "%s"', output_file))
        else
          vim.notify("Compiling failed", vim.log.levels.ERROR, {
            title = "PlantUML Compilation",
          })
        end
      end)
    )
  end,
  {}
)

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
