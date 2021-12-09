require'format'.setup {
  java = {{cmd = {"prettier -w \"/*.java\""}}},
  html = {{cmd = {"prettier -w"}}},
  javascript = {{cmd = {"prettier -w"}}},
}
