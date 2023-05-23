local M = { 'kosayoda/nvim-lightbulb' }

M.dependencies = { 'antoinemadec/FixCursorHold.nvim' }

M.config = function()
    local status, lightbulb = pcall(require, 'nvim-lightbulb')
    if not status then return end

    local icon = ''
    vim.fn.sign_define('LightBulbSign', { text = icon, texthl = 'LspDiagnosticsDefaultInformation' })

    lightbulb.setup {
        autocmd = {
            enabled = true
        },
    }
end

return M

-- https://github.com/kosayoda/nvim-lightbulb