return {
    "glepnir/lspsaga.nvim",
    enabled = false,
    event = "LspAttach",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = true,
                separator = "  ", -- 
                ignore_patterns = {},
                truehide_keyword = true,
                show_file = true,
                folder_level = 1, -- 0 show no path, 1 show file name, >2 path
                respect_root = false,
                color_mode = false, -- Font with color
            },
        })
    end,
    opts = {},
}
