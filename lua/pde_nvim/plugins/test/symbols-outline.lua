local settings_status, settings = pcall(require, 'settings')
if not settings_status then return end

local ut_status, utils = pcall(require, settings.namespace .. 'helpers.utils')
if not ut_status then return end

local map = utils.map
local git = settings.git

local M = { git .. '/symbols-outline.nvim' }

M.config = function()
    local status, sy_outline = pcall(require, 'symbols-outline')
    if not status then return end

    sy_outline.setup {
        show_guides = true,
        show_symbol_details = true,
        auto_preview = false,
        symbols = {
            File = { icon = '', hl = '@text.uri' },
            Module = { icon = '', hl = '@namespace' },
            Namespace = { icon = '', hl = '@namespace' },
            Package = { icon = '', hl = '@namespace' },
            Class = { icon = '', hl = '@type' },
            Method = { icon = '', hl = '@method' },
            Property = { icon = '', hl = '@method' },
            Field = { icon = '', hl = '@field' },
            Constructor = { icon = '', hl = '@constructor' },
            Enum = { icon = '', hl = '@type' },
            Interface = { icon = '', hl = '@type' },
            Function = { icon = '', hl = '@function' },
            Variable = { icon = '', hl = '@constant' },
            Constant = { icon = '', hl = '@constant' },
            String = { icon = '', hl = '@string' },
            Number = { icon = '', hl = '@number' },
            Boolean = { icon = '', hl = '@boolean' },
            Array = { icon = '', hl = '@constant' },
            Object = { icon = '', hl = '@type' },
            Key = { icon = '', hl = '@type' },
            Null = { icon = '', hl = '@type' },
            EnumMember = { icon = '', hl = '@field' },
            Struct = { icon = '', hl = '@type' },
            Event = { icon = '', hl = '@type' },
            Operator = { icon = '', hl = '@operator' },
            TypeParameter = { icon = '', hl = '@parameter' },
            Component = { icon = '', hl = '@function' },
            Fragment = { icon = '', hl = '@constant' },
        },
    }

    map('n', '<f8>', ':SymbolsOutline<cr>', { desc = 'Toggle symbols outline' }) -- leader T
end

return M

-- https://github.com/simrat39/symbols-outline.nvim