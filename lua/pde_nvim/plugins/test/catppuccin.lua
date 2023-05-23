local git = require('utils').git

local M = { git .. '/catppuccin.nvim' }

M.name = 'catppuccin'

M.config = function ()
    local status, catppuccin = pcall(require, 'catppuccin')
    if not status then return end

    catppuccin.setup(
        {
            flavour = 'mocha', -- latte, frappe, macchiato, mocha
            term_colors = true,
            styles = {
                comments = { 'italic' },
                conditionals = { 'italic' },
                loops = { 'italic' },
                functions = {},
                keywords = { 'italic' },
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                barbecue = true,
                mason = true,
                native_lsp = true
            },
        }
    )
end

return M

-- https://github.com/catppuccin/nvim