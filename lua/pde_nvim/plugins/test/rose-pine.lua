local M = { 'rose-pine/neovim' }

M.as = 'rose-pine'

M.config = function ()
    local status, rose_pine = pcall(require, 'rose-pine')
    if not status then return end

    rose_pine.setup {
        dark_variant = 'main' -- moon, main
    }
end

-- indent-blankline plugin
vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

return M

-- https://github.com/rose-pine/neovim