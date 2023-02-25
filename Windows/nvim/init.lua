--[[

Neovim init file
	~ nonyoo

--]]

-----------------------------------------------------------
-- Import core settings.
-----------------------------------------------------------

require ("core.options")
require ("core.plugins")
require ("core.maps")
require ("core.colors")
require ("core.autocmds")
require ("core.highlights")

-----------------------------------------------------------
-- Import configs modules
-----------------------------------------------------------

require ("configs.lsp")
require ("configs.git")
require ("configs.zenmode")
require ("configs.ts-autotag")
require ("configs.lspkind")
require ("configs.lualine")
require ("configs.prettier")
require ("configs.nvim-cmp")
require ("configs.autopairs")
require ("configs.nvim-tree")
require ("configs.colorizer")
require ("configs.telescope")
require ("configs.bufferline")
require ("configs.web-devicons")
require ("configs.nvim-treesitter")
require ("configs.indent-blankline")
