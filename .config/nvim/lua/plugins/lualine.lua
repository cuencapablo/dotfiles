return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        globalstatus = false,
        theme = "auto",
        disabled_filetypes = { "mason", "dashboard", "lazy", "alpha" },
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        ignore_focus = {},
        always_divide_middle = true,
        refresh = {
          statusline = 1000,
          -- tabline = 1000,
        },
      },
      sections = {
        lualine_a = {
          { -- mode component
            function()
              return ""
            end,
            color = function()
              -- auto change color according to neovims mode
              local modecolor = {
                n = "#2d2a2e",
                i = "#ffd866",
                v = "#78dce8",
                [""] = "#FF8832",
                V = "#a9dc76",
                c = "#a678df",
                no = "#ff6188",
                s = "#FF8800",
                S = "#FF8832",
                [""] = "#6B6770",
                ic = "#ECBE3B",
                R = "#a9a1e1",
                Rv = "#a9a1e1",
                cv = "#ec5f89",
                ce = "#ec5f11",
                r = "#c1c0c0",
                rm = "#008080",
                ["r?"] = "#c1c0c0",
                ["!"] = "#Fc5f66",
                t = "#403e41",
              }
              return { fg = modecolor[vim.fn.mode()], bg = "None" }
            end,
            padding = { left = 1, right = 0 },
          },
        },

        lualine_b = {
          {
            "branch",
            icon = "",
            padding = { left = 1, right = 0 },
            color = { fg = "#736290", gui = "bold", bg = "None" },
          },
        },

        lualine_c = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = "  ", hint = " " },
            color = { bg = "None" },
          },
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            path = 0,
            symbols = { modified = "", readonly = "", unnamed = "[No mame]", newfile = "[New]" },
            color = { bg = "None" },
          },
          -- stylua: ignore
        },

        lualine_x = {
                -- stylua: ignore
                -- {
                --   function() return require("noice").api.status.command.get() end,
                --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                --   color = { fg = "#c1c0c0", bg = "#19181a" },
                -- },
                -- -- stylua: ignore
                -- {
                --   function() return require("noice").api.status.mode.get() end,
                --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                --   color = { fg = "#c1c0c0", bg = "#19181a" },
                -- },
                -- { require("lazy.status").updates, cond = require("lazy.status").has_updates,
                --   color = { fg = "#c1c0c0", bg = "#19181a" },
                -- },
                    {
                    "diff",
                    symbols = { added = " ", modified = " ", removed = " " },
                    color = { bg = 'None' },
                    },
        },

        lualine_y = {
          {
            -- Lsp server name .
            function()
              local msg = ""
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return ""
                end
              end
              return msg
            end,
            -- icon = " ",
            color = { fg = "#2d2a2e", bg = "None" },
          },
        },

        lualine_z = {
          {
            "progress",
            padding = { left = 1, right = 0 },
            color = { fg = "#484849", bg = "None" },
          },
          {
            "location",
            padding = { left = 1, right = 1 },
            color = { fg = "#484849", bg = "None" },
          },
          -- function()
          --   return " " .. os.date("%R")
          -- end,
        },
      },
      extensions = {
        "neo-tree",
      },
    })
  end,
}
