local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/indent-blankline.nvim' }

M.event = { "BufReadPost", "BufNewFile" }

M.config = function()
    local status, indent_blankline = pcall(require, 'indent_blankline')
    if (not status) then return end

    indent_blankline.setup {
        char = '',
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = false,
        show_end_of_line = true,
        space_char_blankline = " ",
        use_treesitter = true,
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
            "NvimTree",
            "Trouble",
            "Float"
        },
        buftype_exclude = {
            'terminal',
            'NvimTree',
            "telescope", "nofile",
        },
    }
end

return M

-- https://github.com/lukas-reineke/indent-blankline.nvim
