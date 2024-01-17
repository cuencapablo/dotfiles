return {
  {
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
  },

  {
    "SmiteshP/nvim-navic",
    enabled = false,
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      local icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      }

      return {
        separator = "  ",
        highlight = false,
        depth_limit = 5,
        icons = icons,
      }
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "v3.*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        indicator = { style = "icon", icon = "" },
        -- max_name_length = 10,
        -- max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
        -- tab_size = 15,
        diagnostics = "nvim_lsp",
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        color_icons = false,
        separator_style = "thin", --- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        always_show_bufferline = false,
        show_buffer_icons = false, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        enforce_regular_tabs = true,
        -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "") .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Directory",
            highlight = "NONE",
          },
        },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      -- all the sub-options of filetypes apply to buftypes
      user_default_options = {
        tailwind = true,
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      },
      buftypes = {},
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
            |\      _,,,---,,_
        ZZZzz /,`.-'`'    -.  ;-;;,_
            |,4-  ) )-,_. ,\ (  `'-'
            '---''(_/--'  `-'\_)  Nonyoo
        ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    keys = {
      -- Transparency
      vim.keymap.set("n", "yob", "<cmd>TransparentToggle<cr>", { silent = true }),
      desc = "Toggle transparency",
    },
    opts = {
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLineNr",
        "EndOfBuffer",
      },
      extra_groups = {},
      exclude_groups = {},
    },
  },

  {
    "rcarriga/nvim-notify",
    -- enabled = false, -- To  disable a plugin
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      timeout = 1000,
      render = "compact",
      stages = "static",
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      local Util = require("lazyvim.util")
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = false,
          view = nil, -- when nil, use defaults from documentation
          opts = {}, -- merged with defaults from documentation
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = true,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = nil, -- when nil, use defaults from documentation
          opts = {}, -- merged with defaults from documentation
        },
        progress = {
          enabled = false,
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          --- @type NoiceFormat|string
          format = "lsp_progress",
          --- @type NoiceFormat|string
          format_done = "lsp_progress_done",
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = "mini",
        },
        message = {
          -- Messages shown by lsp servers
          enabled = true,
          view = "notify",
          opts = {},
        },
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = false, -- enables the Noice messages UI - That shit on the botton right
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          border = {
            -- style = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█", "1" }, -- [ top top top - right - bottom bottom bottom - left ]
            style = "rounded",
            padding = { 0, 1 },
          },
          filter_options = {},
        },
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "nui", -- backend to use to show regular cmdline completions
        ---@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons
      },
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {}, -- global options for the cmdline. See section on views
      },
      redirect = {
        view = "popup",
        filter = { event = "msg_show" },
      },
    },
  },
}
