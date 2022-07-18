local highlight =
  require("functions").notifreq("nvim-treesitter.highlight", "treesitter-config.custom-highlight", "error")
if highlight == nil then
  return
end

highlight.set_custom_captures({
  -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
  ["param"] = "Identifier",
})
