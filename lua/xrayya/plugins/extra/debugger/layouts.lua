M = {}
M.running = {
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
M.running_console = {
  {
    elements = {
      {
        id = "repl",
        size = 0.2,
      },
      {
        id = "console",
        size = 0.8,
      },
    },
    position = "bottom",
    size = 0.45,
  },
}
M.debugging_console = {
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
M.debugging = {
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
return M
