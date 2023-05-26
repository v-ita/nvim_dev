local g = vim.g
local git = g.git_username or 'taftadahir'
local namespace = g.namespace or 'pde_nvim'

local helpers_status, helpers = pcall(require, namespace .. '.helpers')
if not helpers_status then return end

local M = { git .. '/dashboard-nvim' }

M.dependencies = {
    { git .. '/nvim-web-devicons' } -- required
}

M.event = 'VimEnter'

M.config = function()
    local status, dashboard = pcall(require, 'dashboard')
    if not status then return end

    dashboard.setup {
        theme = 'hyper', -- hyper, doom
        hide = {
            statusline = true,
            tabline = true,
            winbar = true
        },
        config = {
            header = helpers.ascii_art.default,
            packages = {
                enable = true
            },
            project = { enable = false },
            mru = { limit = 10, icon = '  ', label = 'Recent files                                                 ', },
            shortcut = { 
            --     {
            --     desc = ' Explorer',
            --     group = 'DashboardShortCut',
            --     key = 'e',
            --     action = 'NvimTreeToggle'
            -- },
            {
                desc = ' Explorer',
                group = 'DashboardShortCut',
                key = 'e',
                action = 'NeoTreeFocusToggle'
            }, {
                desc = '  Find files',
                group = 'DashboardShortCut',
                key = 'f',
                action = 'Telescope find_files'
            }, {
                desc = '  Plugin sync',
                group = 'DashboardShortCut',
                key = 'u',
                action = 'Lazy sync'
            }, {
                desc = '  Quit',
                group = 'DashboardShortCut',
                key = 'q',
                action = 'qa'
            } },
            footer = { '', '', '  My personal development environment  ', '', '    󰡄          ' }
        }
    }
end

return M

-- https://github.com/glepnir/dashboard-nvim
-- https://github.com/nvim-tree/nvim-web-devicons
