local g = vim.g
local git = g.git_username or 'taftadahir'
local namespace = g.namespace or 'pde_nvim'

local M = { git .. '/nvim-lspconfig' }

M.dependencies = {
    { git .. '/schemastore.nvim', ft = 'json' },
    -- { 'folke/lsp-colors.nvim' },
}

M.config = function()
    local lsp_status, lspconfig = pcall(require, 'lspconfig')
    if not lsp_status then return end

    local servers_status, servers = pcall(require, namespace .. '.plugins.lsp.servers')
    if not servers_status then return end

    local handlers_status, handlers = pcall(require, namespace .. '.plugins.lsp.handlers')
    if not handlers_status then return end

    for _, server in ipairs(servers) do
        local settings = {}

        local stg_status, setting_opt = pcall(require, namespace .. '.plugins.lsp.setup.' .. server)
        if stg_status then
            settings = setting_opt.settings
        end

        if server == 'bashls' then
            lspconfig[server].setup {
                on_attach = handlers.on_attach,
                capabilities = handlers.capabilities,
                settings = settings,
                filetypes = { 'zsh', 'bash', 'sh' }
            }
        else
            lspconfig[server].setup {
                on_attach = handlers.on_attach,
                capabilities = handlers.capabilities,
                settings = settings
            }
        end
    end
end

return M

-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/folke/lsp-colors.nvim
