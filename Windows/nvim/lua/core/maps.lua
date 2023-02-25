-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = ','

-----------------------------------------------------------
-- Defining mappings
-----------------------------------------------------------

-- '' 	- mapmode-nvo	- Normal, Visual, Select, Operator-pending 	- :map
-- 'n'	- mapmode-n	- Normal					        - :nmap
-- 'v'	- mapmode-v	- Visual and Select				- :vmap
-- 's'	- mapmode-s	- Select					        - :smap
-- 'x'	- mapmode-x	- Visual					        - :xmap
-- 'o'	- mapmode-o	- Operator-pending				- :omap
-- '!'	- mapmode-ic	- Insert and Command-line			- :map!
-- 'i'	- mapmode-i	- Insert					        - :imap
-- 'l'	- mapmode-l	- Insert, Command-line, Lang-Arg		- :lmap
-- 'c'	- mapmode-c	- Command-line					  - :cmap
-- 't'	- mapmode-t	- Terminal					      - :tmap

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Do not yonk with x
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- Increment|drecement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Delete a word backward
map('n', 'dw', 'vb"_d')
-- Delete a word backward
map('!', '<C-h>', '<C-W>')

-- Select All
map('n', '<C-a>', 'gg<S-v>G')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Disable Ctrl+z, suspend nvim windows
map('', '<C-z>', '<nop>')
map('!', '<C-z>', '<nop>')

-- Map Esc to Ctrl+/ (slash) Dvorak keyboard
map('', '<C-_>', '<Esc>')
map('!', '<C-_>', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<Leader>p', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<Leader>p'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close windows
map('n', '<leader>w', ':bdelete<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':q!<CR>')

-- Close buffer tab
map('n', '<leader>d', ':bd<CR>')

-- Easy add date/time
map("n", "<Leader>#", "\"=strftime('%c')<CR>Pa", { silent = true })

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<Leader>t', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-----------------------------------------------------------
-- Bufferline Maps
-----------------------------------------------------------
--These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', '<leader>e', ':BufferLineCycleNext<CR>')
map('n', '<leader>a', ':BufferLineCyclePrev<CR>')

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '<leader>oe', ':BufferLineMoveNext<CR>')
map('n', '<leader>oa', ':BufferLineMovePrev<CR>')

-- These commands will sort buffers by directory, language, or a custom criteria
map('n', '<leader>be', ':BufferLineSortByExtension<CR>')
map('n', '<leader>bd', ':BufferLineSortByDirectory<CR>')
--map('n', '<leader>bc', ':lua require("bufferline").sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>')

-----------------------------------------------------------
-- Modes ZenMode and ...
-----------------------------------------------------------
-- ZenMode
vim.keymap.set('n', '<leader>x', '<cmd>ZenMode<cr>', { silent = true })
