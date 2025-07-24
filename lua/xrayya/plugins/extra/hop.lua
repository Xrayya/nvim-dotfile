---@type LazySpec
return {
  {
    "phaazon/hop.nvim",
    enabled = false,
    opts = {},
    keys = {
      {
        "f",
        function()
          require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
        end,
        mode = "",
      },
      {
        "F",
        function()
          require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
        end,
        mode = "",
      },
    },
  },
}
