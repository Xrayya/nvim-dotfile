vim.api.nvim_create_user_command("CppCompile",  function()
  local input_file = vim.fn.expand("%:p")
  local output_file = vim.fn.expand("%:p:r")

  if vim.fn.has("win32") > 0 then
    output_file = output_file .. ".exe"
  else
    output_file = output_file .. ".out"
  end

  ---@diagnostic disable-next-line: missing-fields
  vim.uv.spawn("g++", {
    args = { "-fdiagnostics-color=always", "-Wall", "-g", input_file, "-o", output_file },
  }, function(code, _)
    if code == 0 then
      vim.notify("Compiling done", vim.log.levels.INFO, {
        title = "C++ Compilation",
      })
    else
      vim.notify("Compiling failed", vim.log.levels.ERROR, {
        title = "C++ Compilation",
      })
    end
  end)
end, {})
