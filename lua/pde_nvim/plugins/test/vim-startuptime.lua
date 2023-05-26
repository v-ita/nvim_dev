local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/vim-startuptime' }

M.cmd = 'StartupTime'

return M

-- https://github.com/dstein64/vim-startuptime