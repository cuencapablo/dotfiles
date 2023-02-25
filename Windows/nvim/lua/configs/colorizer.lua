-----------------------------------------------------------
-- Colorizer
----------------------------------------------------------

-- Plugin: Colorizer
-- url: https://github.com/nvim-lualine/lualine.nvim

-- Check if the plugin is installed
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

-- All the configs
colorizer.setup()
