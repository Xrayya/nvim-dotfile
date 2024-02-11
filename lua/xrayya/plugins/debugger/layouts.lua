local debug_ui_layouts = {}
debug_ui_layouts.running = {
  {
    elements = {
      {
        id = "repl",
        size = 1,
      },
    },
    position = "bottom",
    size = 10,
  },
}
debug_ui_layouts.running_console = {
  {
    elements = {
      {
        id = "repl",
        size = 27,
      },
      {
        id = "console",
        size = 1,
      },
    },
    position = "bottom",
    size = 0.45,
  },
}
debug_ui_layouts.debugging_console = {
  {
    elements = {
      {
        id = "scopes",
        size = 0.25,
      },
      {
        id = "breakpoints",
        size = 0.25,
      },
      {
        id = "stacks",
        size = 0.25,
      },
      {
        id = "watches",
        size = 0.25,
      },
    },
    position = "left",
    size = 40,
  },
  {
    elements = {
      {
        id = "repl",
        size = 0.5,
      },
      {
        id = "console",
        size = 0.5,
      },
    },
    position = "bottom",
    size = 0.45,
  },
}
debug_ui_layouts.debugging = {
  {
    elements = {
      {
        id = "scopes",
        size = 0.25,
      },
      {
        id = "breakpoints",
        size = 0.25,
      },
      {
        id = "stacks",
        size = 0.25,
      },
      {
        id = "watches",
        size = 0.25,
      },
    },
    position = "left",
    size = 40,
  },
  {
    elements = {
      {
        id = "repl",
        size = 1,
      },
    },
    position = "bottom",
    size = 10,
  },
}
return debug_ui_layouts
