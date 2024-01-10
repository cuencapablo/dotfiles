return {
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
}
