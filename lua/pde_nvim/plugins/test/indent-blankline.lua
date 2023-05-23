local git = require('lua.utils').git

local M = { git .. '/indent-blankline.nvim' }

M.config = function()
    local status, indent_blankline = pcall(require, 'indent_blankline')
    if (not status) then return end

    indent_blankline.setup {
        char = '',
        show_trailing_blankline_indent = false,
        show_end_of_line = true,
        space_char_blankline = " ",
        char_highlight_list = {
            'IndentBlanklineIndent1',
            'IndentBlanklineIndent2',
        },
        space_char_highlight_list = {
            'IndentBlanklineIndent1',
            'IndentBlanklineIndent2',
        },
        filetype_exclude = {
            'help',
            'terminal',
            'dashboard',
            'packer',
            'lspinfo',
            'TelescopePrompt',
            'TelescopeResults',
        },
        buftype_exclude = {
            'terminal',
            'NvimTree',
        },
    }
end

return M

-- https://github.com/lukas-reineke/indent-blankline.nvim