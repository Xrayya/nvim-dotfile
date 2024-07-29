local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<F5>", function()
  local input_file = vim.fn.expand("%:p")
  local output_file = vim.fn.expand("%:p:r")

  if vim.fn.has("win32") > 0 then
    output_file = output_file .. ".exe"
  else
    output_file = output_file .. ".out"
  end

  local cmd = string.format('g++ -fdiagnostics-color=always -g "%s" -o "%s"', input_file, output_file)
  local result = vim.fn.system(cmd)

  if string.find(result, "error") then
    vim.notify(result, vim.log.levels.ERROR)
  else
    vim.notify("Compiling done", vim.log.levels.INFO)
  end
end, opts)
