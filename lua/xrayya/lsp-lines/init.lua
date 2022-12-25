local lsp_lines = NOTIF_REQ("lsp_lines", "xrayya.lsp_lines", "error")
if lsp_lines == nil then
  return
end

lsp_lines.setup()
lsp_lines.toggle();
