local git = require('lua.utils').git

local M = { git .. '/lsp_lines.nvim' }

M.config = function()
    local status, lsp_lines = pcall(require, 'lsp_lines')
    if not status then return end

    -- disable default virtual text
    vim.diagnostic.config {
        virtual_text = false
    }

    lsp_lines.setup {}
end

return M

-- https://git.sr.ht/~whynothugo/lsp_lines.nvim