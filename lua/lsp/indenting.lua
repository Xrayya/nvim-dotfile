require("indent_blankline").setup {
  buftype_exclude = {"terminal"},
  filetype_exclude = {"dashboard", "alpha", "NvimTree", "packer", "help"},
  space_char_blankline = " ",
  show_current_context = true,
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "^for", "^object", "^table", "else_clause", "arguments", "if_statement",
    "java_element", "java_self_closing_element", "try_statement", "catch_clause", "import_statement", "operation_type", "while_statement",
    "for_statement", "^switch", "switch_statement"
  },
}
