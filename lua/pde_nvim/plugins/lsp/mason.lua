local g = vim.g
local git = g.git_username or 'taftadahir'
local namespace = g.namespace or 'pde_nvim'

local M = { git .. '/mason.nvim' }

M.dependencies = {
    { git .. '/mason-lspconfig.nvim' },
}

M.config = function()
    local mason_status, mason = pcall(require, 'mason')
    if not mason_status then return end

    local mason_cfg_status, mason_config = pcall(require, 'mason-lspconfig')
    if not mason_cfg_status then return end

    local servers_status, servers = pcall(require, namespace .. '.plugins.lsp.servers')
    if not servers_status then return end

    mason.setup({
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    })

    mason_config.setup({
        ensure_installed = servers,
        automatic_installation = true,
    })
end

return M

-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim