local external = {
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    branch = "client-server",
    build = ":Cord update",
    config = function()
      require("cord").setup({
        text = {
          viewing = function(opts)
            return "Viewing " .. opts.filename
          end,
          editing = function(opts)
            local text = "Editing " .. opts.filename
            if vim.bo.modified then
              text = text .. "[+]"
            end
            return text
          end,
          file_browser = function(opts)
            return "Browsing files using " .. opts.tooltip
          end,
          plugin_manager = function(opts)
            return "Managing plugins using " .. opts.tooltip
          end,
          lsp = function(opts)
            return "Configuring LSP using " .. opts.tooltip
          end,
          docs = function(opts)
            return "Reading " .. opts.tooltip
          end,
          vcs = function(opts)
            return "Committing changes using " .. opts.tooltip
          end,
          workspace = function(opts)
            local hour = tonumber(os.date("%H"))
            local status = hour >= 22 and "🌙 Late night coding"
              or hour >= 18 and "🌆 Evening session"
              or hour >= 12 and "☀️ Afternoon coding"
              or hour >= 5 and "🌅 Morning productivity"
              or "🌙 Midnight hacking"

            return string.format("%s: %s", status, opts.workspace_name)
          end,
          dashboard = "Home",
        },
        buttons = {
          {
            label = function(opts)
              return opts.repo_url and "View Repository" or "Website"
            end,
            url = function(opts)
              return opts.repo_url or "https://example.com"
            end,
          },
        },
        idle = {
          details = function(opts)
            return string.format("Taking a break from %s", opts.workspace_name)
          end,
        },
      })
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
}

return external
