local M = { 'Mofiqul/dracula.nvim' }

M.config = function ()
    local status, dracula = pcall(require, 'dracula')
    if not status then return end

    dracula.setup {}
end

-- indent-blankline plugin
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

return M

-- https://github.com/Mofiqul/dracula.nvim