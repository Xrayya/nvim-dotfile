-- local inlayhints = NOTIF_REQ("inlay-hints", "lsp-inlayhints-config", "error")
-- if inlayhints == nil then
--   return
-- end

-- inlayhints.setup({
--   hints = {
--     parameter = {
--       show = true,
--       highlight = "NavicText",
--     },
--     type = {
--       show = true,
--       highlight = "NavicText",
--     },
--   },
-- })

-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = "LspAttach_inlayhints",
--   callback = function(args)
--     if not (args.data and args.data.client_id) then
--       return
--     end

--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     inlayhints.on_attach(client, args.buf)
--   end,
-- })

local hints = NOTIF_REQ("lsp-inlayhints", "lsp-inlayhints-config", "error")
if hints == nil then
  return
end

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    hints.on_attach(client, args.buf)
  end,
})

hints.setup()

-- hints.setup({
--   inlay_hints = {
--     parameter_hints = {
--       show = true,
--       prefix = "<- ",
--       separator = ", ",
--       remove_colon_start = true,
--       remove_colon_end = true,
--     },
--     type_hints = {
--       -- type and other hints
--       show = true,
--       prefix = "",
--       separator = ", ",
--       remove_colon_start = false,
--       remove_colon_end = true,
--     },
--     -- separator between types and parameter hints. Note that type hints are
--     -- shown before parameter
--     labels_separator = "  ",
--     -- whether to align to the length of the longest line in the file
--     max_len_align = false,
--     -- padding from the left if max_len_align is true
--     max_len_align_padding = 1,
--     -- whether to align to the extreme right or not
--     right_align = false,
--     -- padding from the right if right_align is true
--     right_align_padding = 7,
--     -- highlight group
--     highlight = "NavicText",
--   },
--   enabled_at_startup = true,
--   debug_mode = false,
-- })
