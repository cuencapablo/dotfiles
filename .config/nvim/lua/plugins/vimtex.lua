return {
    "lervag/vimtex",
    init = function()

        -- Vim Text Config

        local g = vim.g
        -- PDF Viewer:
        -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
        -- syntax enable

        g.vimtex_view_method = "zathura"

        -- -- Ignore mappings
        g.vimtex_mappings_enabled = 1
        --
        -- -- Auto Indent
        g.vimtex_indent_enabled = 0
        --
        -- -- Syntax highlighting
        g.vimtex_syntax_enabled = 0
        -- g.latex_enabled = 1
        g.latex_default_mappings = 1

        -- Error suppression:
        -- https://github.com/lervag/evimtex/blob/master/doc/vimtex.txt
        g.vimtex_quickfix_open_on_warning = 0

        g.vimtex_log_ignore = {
            "Underfull",
            "Overfull",
            "specifier changed to",
            "Token not allowed in a PDF string",
        }

        -- vim.g['vimtex_complete_enabled'] = 1
        -- vim.g['vimtex_compiler_progname'] = 'nvr'
        -- vim.g['vimtex_complete_close_braces'] = 1
    end,
}
