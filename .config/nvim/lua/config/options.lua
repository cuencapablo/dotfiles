-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local opt = vim.opt -- Set options (global/buffer/windows-scoped)
local o = vim.o -- Set options (global/buffer/windows-scoped)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-----------------------------------------------------------
-- UI Quick configuration

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })
----------------------------------------------------------

opt.spelllang = { "en", "es" }
opt.spell = true

opt.conceallevel = 0 -- Nothing in hidden
opt.title = false -- Show title
opt.expandtab = true -- Use spaces instead of tabs
opt.swapfile = false -- creates a swap file
opt.backup = false -- creates a backup file
opt.wrap = true -- Disable line wrap
opt.cmdheight = 0
opt.showcmd = false
opt.showmode = false
opt.mouse = "" -- Disable mouse mode

o.tabstop = 2 -- A TAB character looks like 4 spaces
o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
o.shiftwidth = 2 -- Number of spaces inserted when indenting

---- Configure how listchars should appear.
o.listchars = table.concat({ "tab:▸ ", "trail:·", "extends:", "nbsp:␣" }, ",") -- 'eol:¬',

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
