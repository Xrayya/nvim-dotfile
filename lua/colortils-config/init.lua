local colortils = NOTIF_REQ("colortils", "colortils-config", "error")
if colortils == nil then
  return
end

colortils.setup()
