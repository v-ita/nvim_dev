local g = vim.g
local git = g.git_username or 'taftadahir'

-- local ut_status, utils = pcall(require, settings.namespace .. 'helpers.utils')
-- if not ut_status then return end

-- local map = utils.map
-- local git = settings.git

local M = { git .. '/symbols-outline.nvim' }

M.cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen' }

M.config = function()
    local status, sys_outline = pcall(require, 'symbols-outline')
    if not status then return end

    sys_outline.setup {
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

    -- map('n', '<f8>', ':SymbolsOutline<cr>', { desc = 'Toggle symbols outline' }) -- leader T
end

-- M.opts = {
--     highlight_hovered_item = true,
--     show_guides = true,
--     auto_preview = false,
--     position = "right",
--     relative_width = false,
--     width = 25,
--     auto_close = true,
--     show_numbers = false,
--     show_relative_numbers = false,
--     show_symbol_details = true,
--     preview_bg_highlight = "Pmenu",
--     autofold_depth = nil,
--     auto_unfold_hover = true,
--     fold_markers = { "", "" },
--     wrap = false,
--     keymaps = {
--         -- These keymaps can be a string or a table for multiple keys
--         close = { "<Esc>", "q" },
--         goto_location = "<Cr>",
--         focus_location = "o",
--         hover_symbol = "<C-space>",
--         toggle_preview = "K",
--         rename_symbol = "r",
--         code_actions = "a",
--         fold = "h",
--         unfold = "l",
--         fold_all = "W",
--         unfold_all = "E",
--         fold_reset = "R",
--     },
--     lsp_blacklist = {},
--     symbol_blacklist = {},
--     symbols = {
--         File = { icon = "", hl = "@text.uri" },
--         Module = { icon = "", hl = "@namespace" },
--         Namespace = { icon = "", hl = "@namespace" },
--         Package = { icon = "", hl = "@namespace" },
--         Class = { icon = "𝓒", hl = "@type" },
--         Method = { icon = "ƒ", hl = "@method" },
--         Property = { icon = "", hl = "@method" },
--         Field = { icon = "", hl = "@field" },
--         Constructor = { icon = "", hl = "@constructor" },
--         Enum = { icon = "ℰ", hl = "@type" },
--         Interface = { icon = "ﰮ", hl = "@type" },
--         Function = { icon = "", hl = "@function" },
--         Variable = { icon = "", hl = "@constant" },
--         Constant = { icon = "", hl = "@constant" },
--         String = { icon = "𝓐", hl = "@string" },
--         Number = { icon = "#", hl = "@number" },
--         Boolean = { icon = "⊨", hl = "@boolean" },
--         Array = { icon = "", hl = "@constant" },
--         Object = { icon = "⦿", hl = "@type" },
--         Key = { icon = "🔐", hl = "@type" },
--         Null = { icon = "NULL", hl = "@type" },
--         EnumMember = { icon = "", hl = "@field" },
--         Struct = { icon = "𝓢", hl = "@type" },
--         Event = { icon = "🗲", hl = "@type" },
--         Operator = { icon = "+", hl = "@operator" },
--         TypeParameter = { icon = "𝙏", hl = "@parameter" },
--         Component = { icon = "", hl = "@function" },
--         Fragment = { icon = "", hl = "@constant" },
--     },
-- }

M.keys = {
    { '<f8>', ':SymbolsOutline<cr>', desc = 'Toggle symbols outline' }
}

return M

-- https://github.com/simrat39/symbols-outline.nvim
