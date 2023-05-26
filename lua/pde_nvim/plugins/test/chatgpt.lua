local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/ChatGPT.nvim' }

M.dependencies = {
    { git .. '/nui.nvim' },
    { git .. '/plenary.nvim' },
}

M.event = "VeryLazy"

M.config = function()
    local status, chatgpt = pcall(require, 'chatgpt')
    if not status then return end

    chatgpt.setup {
        api_key_cmd = nil
    }
end

return M

-- https://github.com/jackMort/ChatGPT.nvim