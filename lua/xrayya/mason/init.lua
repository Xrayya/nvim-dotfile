local mason = NOTIF_REQ("mason", "mason-config", "error")
if mason == nil then
  return
end

mason.setup({
  ui = {
    border = "rounded",
  },
})
