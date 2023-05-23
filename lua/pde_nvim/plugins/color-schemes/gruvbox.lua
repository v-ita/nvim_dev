local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/gruvbox.nvim' }

M.config = function ()
    local status, gruvbox = pcall(require, 'gruvbox')
    if not status then return end

    gruvbox.setup { }
end

-- indent-blankline plugin
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

return M

-- https://github.com/ellisonleao/gruvbox.nvim