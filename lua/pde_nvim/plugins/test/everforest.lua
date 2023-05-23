local M = { 'sainnhe/everforest' }

M.config = function ()
    local status, everforest = pcall(require, 'everforest')
    if not status then return end

    everforest.setup {
        background = 'hard'
    }
end

-- indent-blankline plugin
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

return M

-- https://github.com/sainnhe/everforest