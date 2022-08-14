local numb = NOTIF_REQ("numb", "numb-config", "error")
if numb == nil then
  return
end

numb.setup({
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
  centered_peeking = true, -- Peeked line will be centered relative to window
})
