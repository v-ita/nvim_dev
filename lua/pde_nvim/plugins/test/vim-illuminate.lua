local utils = require('lua.utils')
local git = utils.git 
-- local map = utils.map

local M = { git .. '/vim-illuminate' }

M.config = function ()
    -- vim.cmd([[
    --     hi link IlluminatedWordText Visual
    --     hi link IlluminatedWordRead Visual
    --     hi link IlluminatedWordWrite Visual
    --     hi MatchParen cterm=none gui=underline
    -- ]])
end

return M

-- https://github.com/RRethy/vim-illuminate