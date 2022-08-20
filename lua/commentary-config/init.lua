local kommentary_config = NOTIF_REQ("kommentary.config", "commentary-config", "error")
if kommentary_config == nil then
  return
end
-- More advance commentary mapping
-- kommentary_config.use_extended_mappings()

-- Prefer single-line comments
kommentary_config.configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
