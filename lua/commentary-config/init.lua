local status_ok, kommentary_config = pcall(require, "kommentary.config")
if not status_ok then
  vim.notify('kommentary-config: failed to load "kommentary.config" module')
  return
end
-- More advance commentary mapping
kommentary_config.use_extended_mappings()

-- Prefer single-line comments
kommentary_config.configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
