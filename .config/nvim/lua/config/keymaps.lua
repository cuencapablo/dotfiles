-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Defining mappings
-----------------------------------------------------------

-- '' 	- mapmode-nvo	- Normal, Visual, Select, Operator-pending 	- :map
-- 'n'	- mapmode-n    	- Normal					                - :nmap
-- 'v'	- mapmode-v    	- Visual and Select				            - :vmap
-- 's'	- mapmode-s    	- Select					                - :smap
-- 'x'	- mapmode-x    	- Visual					                - :xmap
-- 'o'	- mapmode-o    	- Operator-pending			               	- :omap
-- '!'	- mapmode-ic	- Insert and Command-line			        - :map!
-- 'i'	- mapmode-i 	- Insert					                - :imap
-- 'l'	- mapmode-l 	- Insert, Command-line, Lang-Arg		    - :lmap
-- 'c'	- mapmode-c 	- Command-line					            - :cmap
-- 't'	- mapmode-t 	- Terminal					                - :tmap

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Configured nvim files
map("n", "<C-x>", ":e $MYVIMRC <CR>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Do not yonk with x
map("n", "x", '"_x')
map("n", "X", '"_X')

-- Increment|drecement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- New tab
map("n", "te", ":tab split<CR>")
map("n", "<tab>", ":tabnext<Return>", opts)
map("n", "<s-tab>", ":tabprev<Return>", opts)

-- Select All
map("n", "<C-a>", "gg<S-v>G")

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Disable Ctrl+z, suspend nvim windows
map("", "<C-z>", "<nop>")
map("!", "<C-z>", "<nop>")

-- New pane on vertical and close
map("n", "<leader>\\", ":vsplit<CR>")
map("n", "<leader>d", ":close<CR>")

-- Easy add date/time
map("n", "<Leader>#", "\"=strftime('%c')<CR>Pa", { silent = true, desc = "Date" })
