-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

vim.cmd("autocmd!")

local g = vim.g       -- Global variables
local wo = vim.wo       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- UI Quick config
-----------------------------------------------------------
opt.title = true            -- Show title
wo.number = true           -- Show line number
opt.relativenumber = true
wo.cursorline = true
opt.showmode = false   -- Hidde the mode of vim -- INSERT --
opt.showcmd = true    -- Hidde the something
--opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.showmatch = true        -- Highlight matching parenthesis
opt.showbreak = '+++'
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.laststatus= 3         -- Set global statusline
-- For git
wo.signcolumn = 'yes'
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.autoindent = true
opt.smartindent = true      -- Autoindent new lines
opt.smarttab = true
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 4 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.breakindent = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hlsearch = true
opt.backup = false
opt.scrolloff = 10
opt.hidden = true           -- Enable background buffers
opt.lazyredraw = true       -- Faster scrolling
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Encoding
-----------------------------------------------------------
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
opt.backspace = { 'start', 'eol', 'indent' } -- backspace behaviour
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Add asterisk in block comments
vim.opt.formatoptions:append { 'r' }

-- Disable nvim intro
--opt.shortmess:append "sI"

-- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
