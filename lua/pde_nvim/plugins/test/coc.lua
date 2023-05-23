local settings_status, settings = pcall(require, 'settings')
if not settings_status then return end

local git = settings.git

local M = { git .. '/coc.nvim' }

M.dependencies = {
	{ git .. '/dart-vim-plugin' }
}

M.config = function()
  local status, coc = pcall(require, 'coc')
  if not status then return end

  coc.setup {}
end

return M

-- https://github.com/neoclide/coc.nvim