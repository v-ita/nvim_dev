local settings_status, settings = pcall(require, 'settings')
if not settings_status then return end

local git = settings.git

local M = { git .. '/flutter-tools.nvim' }

M.config = function()
  local status, flutter_tools = pcall(require, 'flutter-tools')
  if not status then return end

  flutter_tools.setup {}
end

return M

-- https://github.com/akinsho/flutter-tools.nvim