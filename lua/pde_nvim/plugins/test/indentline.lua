local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/indentLine' }

vim.cmd[[
    let g:indentLine_char = '¦'
]]

return M

-- https://github.com/Yggdroot/indentLine