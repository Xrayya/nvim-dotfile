local indent_blankline = require("functions").notifreq("indent_blankline", "indentation-config", "error")
if indent_blankline == nil then
  return
end

indent_blankline.setup({
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "dashboard",
    "startify",
    "alpha",
    "neogitstatus",
    "NvimTree",
    "packer",
    "help",
    "trouble",
  },
  space_char_blankline = " ",
  show_current_context = true,
  indent_blankline_use_treesitter = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "else_clause",
    "arguments",
    "if_statement",
    "java_element",
    "java_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
    "while_statement",
    "for_statement",
    "^switch",
    "switch_statement",
    "jsx_element",
    "jsx_self_closing_element",
  },
})
