-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

-- {{{ Create autogroup.
--     NOTE: Found in lazy.vim auto commands.

-- ------------------------------------------------------------------------- }}}
-- {{{ Define variables
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local function augroup(name)
  return vim.api.nvim_create_augroup("nvimtraap_" .. name, { clear = true })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Markdown Preview
vim.cmd([[ :command! MdView ! litemdview -t 1 %:p & disown ]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable the concealing in some file formats, the default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown", "latex" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable autoformat for expecific files
autocmd({ "FileType" }, {
    pattern = { "lua", "cpp", "txt" },
    callback = function()
        vim.b.autoformat = false
    end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Don't auto commenting new lines
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Change display number on insert
autocmd("InsertEnter", {
  pattern = "*",
  command = "set norelativenumber",
})

autocmd("InsertLeave", {
  pattern = "*",
  command = "set relativenumber",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable suggestions for specific files
autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    require("cmp").setup.buffer({ enabled = false })
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Transparent groups
vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {},
  vim.tbl_map(function(v)
    return v.hl_group
  end, vim.tbl_values(require("bufferline.config").highlights))
)

-- ------------------------------------------------------------------------- }}}
-- {{{ Set spelling for some file types.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua", "cpp" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ TeX
autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal filetype=tex",
  group = augroup("tex"),
  pattern = { "*.tex", "*.bbl", "*.bib", "*.texx", "*.texb", "*.cls" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki
-- autocmd({ "BufRead", "BufNewFile" }, {
--   command = "setlocal foldlevelstart=2 filetype=wiki | WikiEnable",
--   group = augroup("wiki"),
--   pattern = { "*.md", "*.markdown", "*.wiki" },
-- })

-- ------------------------------------------------------------------------- }}}
-- {{{ WhiteSpace
autocmd("BufWritePre", {
  command = [[%s/\s\+$//e]],
  group = augroup("whitespace"),
})
