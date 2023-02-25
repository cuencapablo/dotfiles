-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "configs.lsp.settings"
require "configs.lsp.null-ls"
require "configs.lsp.lspsaga"
