local M = {}

-- local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

M.on_attach = function(_, bnfr)
    client.server_capabilities.completionProvider = false
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.implementationProvider = false
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.renameProvider = false
    client.server_capabilities.selectionRangeProvider = false
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.typeDefinitionProvider = false
    client.server_capabilities.workspaceSymbolProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.documentHighlightProvider = false
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end
    
    local g = vim.g
    local namespace = g.namespace or 'pde_nvim'

    local status, helpers = pcall(require, namespace .. '.helpers')

    if status then
        local map = helpers.map

        map('n', '<leader>ld', require('telescope.builtin').lsp_type_definitions,
            { desc = 'Go to type definition', buffer = bnfr })                                                                       -- leader D
        map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature help', buffer = bnfr })                               -- leader k
        map('n', '<leader>ln', vim.lsp.buf.rename, { desc = 'Rename', buffer = bnfr })
        map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action', buffer = bnfr })                                     -- leader ca
        map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = 'Format', buffer = bnfr })               -- leader + f
        map('n', '<leader>lk', vim.lsp.buf.hover, { desc = 'Hover documentation', buffer = bnfr })                                   -- K
        map('n', '<leader>lo', require('telescope.builtin').lsp_definitions, { desc = 'Go to definition', buffer = bnfr })           -- gd
        map('n', '<leader>lc', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = bnfr })                               -- gD
        map('n', '<leader>li', require('telescope.builtin').lsp_implementations,
            { desc = 'Go to implementation', buffer = bnfr })                                                                        -- gi
        map('n', '<leader>lr', require('telescope.builtin').lsp_references, { desc = 'Go to reference', buffer = bnfr })             -- gr
        map('n', '<leader>lx', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic', buffer = bnfr })                          -- ;d
        map('n', '<leader>lv', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic', buffer = bnfr })                      -- ,d
        map('n', '<leader>lg', require('telescope.builtin').diagnostics, { desc = 'Diagnostics', buffer = bnfr })                    -- gr
        -- map("n", "gl", "lua vim.lsp.diagnostic.show_line_diagnostics()", {})
    end
end

-- M.capabilities = nil


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem = {
--     documentationFormat = { 'markdown', 'plaintext' },
--     snippetSupport = true,
--     preselectSupport = true,
--     insertReplaceSupport = true,
--     labelDetailsSupport = true,
--     deprecatedSupport = true,
--     commitCharactersSupport = true,
--     tagSupport = { valueSet = { 1 } },
--     resolveSupport = {
--         properties = {
--             'documentation',
--             'detail',
--             'additionalTextEdits',
--         },
--     },
-- }

local cmp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_status then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

M.capabilities = capabilities

return M

-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/plugins/lspconfig.lua
