-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {

  indentLine_enabled = 1,
  filetype_exclude = { "help", "terminal", "alpha", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults", "lsp-installer", "", },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = false,
-- ['|', │'¦', '┆', '┊']
  char = '┆',
  context_char = '│',
-- show_current_context_start = true,  -- underline first line
}
