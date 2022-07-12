-- More advance commentary mapping
require("kommentary.config").use_extended_mappings()

-- Prefer single-line comments
require("kommentary.config").configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
