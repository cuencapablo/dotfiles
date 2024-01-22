return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,

    opts = {
      transparent_background = true,
      terminal_colors = false,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- any other keyword
        type = { italic = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
      },
      filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
      -- Enable this will disable filter option
      day_night = {
        enable = false, -- turn off by default
        day_filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
        night_filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
      },
      inc_search = "background", -- underline | background
      background_clear = {
        "noice",
        "lualine",
        "neo-tree",
        "float_win",
        "toggleterm",
        "telescope",
        "which-key",
        "renamer",
      }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
        indent_blankline = {
          context_highlight = "pro", -- default | pro
          context_start_underline = false,
        },
      },
      -- ---@param c Colorscheme
      -- override = function(c) end,
    },
  },

  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    opts = {
      style = "dark", -- "dark" or "light"
      transparent = true, -- true/false; Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
      styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        string = { italic = true },
        underline = true, -- true/false; for global underline
        undercurl = true, -- true/false; for global undercurl
      },
      -- Add specific hightlight groups
      on_highlights = function(highlights, colors)
        -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
      end,
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
      colors = {},
      highlights = {},
      styles = { -- use "bold,italic"
        types = "bold",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold, italic",
        constants = "NONE",
        functions = "bold",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "NONE",
        virtual_text = "NONE",
      },
      filetypes = { -- Override which filetype highlight groups are loaded
        comment = true,
        go = true,
        html = true,
        java = true,
        javascript = true,
        json = true,
        lua = true,
        markdown = true,
        php = true,
        python = true,
        ruby = true,
        rust = true,
        scss = true,
        toml = true,
        typescript = true,
        typescriptreact = true,
        vue = true,
        xml = true,
        yaml = true,
      },
      plugins = { -- Override which plugin highlight groups are loaded
        aerial = true,
        barbar = true,
        copilot = true,
        dashboard = true,
        flash_nvim = true,
        gitsigns = true,
        hop = true,
        indentline = true,
        leap = true,
        lsp_saga = true,
        lsp_semantic_tokens = true,
        marks = true,
        mini_indentscope = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
        nvim_lsp = true,
        nvim_navic = true,
        nvim_notify = true,
        nvim_tree = true,
        nvim_ts_rainbow = true,
        op_nvim = true,
        packer = true,
        polygot = true,
        rainbow_delimiters = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = true,
        which_key = true,
      },

      options = {
        cursorline = true, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        lualine_transparency = true, -- Center bar transparenty?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
      },
    },
  },
}
