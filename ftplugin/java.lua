vim.cmd([[packadd nvim-notify]])
require("notification-config")

vim.cmd([[packadd nvim-navic]])
require("navic-config")

-- vim.cmd([[packadd fidget.nvim]])
-- require("fidget-config")

vim.cmd([[packadd cmp-nvim-lsp]])

vim.cmd([[packadd nvim-jdtls]])
local nvim_jdtls = require("functions").notifreq("jdtls", "jdtls-config", "error")
if nvim_jdtls == nil then
  return
end

-- Determine OS
local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "linux"
elseif vim.fn.has("win32") == 1 then
  WORKSPACE_PATH = vim.fn.getenv("HOME") .. "/workspace/"
  CONFIG = "win"
end

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local extendedClientCapabilities = nvim_jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

-- TODO: Testing

JAVA_DAP_ACTIVE = false

local bundles = {}

if JAVA_DAP_ACTIVE then
  -- bootstraping java-debug
  -- local install_path = vim.fn.stdpath("data") .. "/dapinstall/java/java-debug"
  -- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  --   vim.notify("jdtls-config: installing java-debug, please wait...", "info", {title= "nvim config file: info"})

  --   local install_commad = "./mvnw clean install"
  --   if CONFIG == "windows" then
  --     install_commad = "mvnw.cmd clean install"
  --   end
  --   vim.fn.system({
  --     "git",
  --     "clone",
  --     "--depth",
  --     "1",
  --     "https://github.com/microsoft/java-debug.git",
  --     install_path,
  --     "&& cd java-debug && ",
  --     install_commad,
  --     "&& echo java-debug successfully installed",
  --   })
  -- end

  vim.list_extend(
    bundles,
    vim.split(
      vim.fn.glob(
        vim.fn.stdpath("data")
          .. "/dapinstall/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
      ),
      "\n"
    )
  )
  -- vim.list_extend(
  --   bundles,
  --   vim.split(
  --     vim.fn.glob(
  --       home .. "/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
  --     ),
  --     "\n"
  --   )
  -- )
  -- vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/vscode-java-test/server/*.jar"), "\n"))
end

-- for fidget.nvim
-- local function progress_report(_, result, ctx)
--   local lsp = vim.lsp
--   local info = {
--     client_id = ctx.client_id,
--   }

--   local kind = "report"
--   if result.complete then
--     kind = "end"
--   elseif result.workDone == 0 then
--     kind = "begin"
--   elseif result.workDone > 0 and result.workDone < result.totalWork then
--     kind = "report"
--   else
--     kind = "end"
--   end

--   local percentage = 0
--   if result.totalWork > 0 and result.workDone >= 0 then
--     percentage = result.workDone / result.totalWork * 100
--   end

--   local msg = {
--     token = result.id,
--     value = {
--       kind = kind,
--       percentage = percentage,
--       title = result.subTask,
--       message = result.subTask,
--     },
--   }
--   -- print(vim.inspect(result))

--   lsp.handlers["$/progress"](nil, msg, info)
-- end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "java", -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. vim.fn.stdpath("data") .. "/lsp_servers/jdtls/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    vim.fn.glob(vim.fn.stdpath("data") .. "/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    vim.fn.stdpath("data") .. "/lsp_servers/jdtls/config_" .. CONFIG,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  },

  on_attach = require("lsp-config.custom-lsp-settings.jdtls_lspconfig").on_attach,
  capabilities = require("lsp-config.custom-lsp-settings.jdtls_lspconfig").capabilities,

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- or https://github.com/redhat-developer/vscode-java#supported-vs-code-settings
  -- for a list of options
  settings = {
    java = {
      jdt = {
        ls = {
          vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m",
        },
      },
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = true,
        -- settings = {
        --   profile = "asdf"
        -- }
      },
    },
    signatureHelp = {
      enable = true,
      description = {
        enable = true,
      },
    },
    completion = {
      favoriteStaticMembers = {
        "org.junit.Assert.*",
        "org.junit.Assume.*",
        "org.junit.jupiter.api.Assertions.*",
        "org.junit.jupiter.api.Assumptions.*",
        "org.junit.jupiter.api.DynamicContainer.*",
        "org.junit.jupiter.api.DynamicTest.*",
        "org.mockito.Mockito.*",
        "org.mockito.ArgumentMatchers.*",
        "org.mockito.Answers.*",
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = false,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    -- bundles = {},
    bundles = bundles,
  },
  -- handlers = {
  --   ["language/progressReport"] = progress_report,
  -- },
}

-- NOTE: issue with cmd height
-- config.handers["language/status"] = function() end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)

-- require('jdtls').setup_dap()

vim.cmd(
  "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
)
vim.cmd(
  "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
)
vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
-- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
-- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

-- install vscode-java-test to use this section

-- vim.cmd([[packadd which-key.nvim]])

-- local which_key = require("functions").notifreq("which-key", "jdtls-config", "error")
-- if which_key == nil then
--   return
-- end

-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local vopts = {
--   mode = "v", -- VISUAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local mappings = {
--   L = {
--     name = "Java",
--     o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
--     v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
--     c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
--     t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
--     T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
--     u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
--   },
-- }

-- local vmappings = {
--   L = {
--     name = "Java",
--     v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
--     c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
--     m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
--   },
-- }

-- which_key.register(mappings, opts)
-- which_key.register(vmappings, vopts)

-- debugging
-- git clone git@github.com:microsoft/java-debug.git
