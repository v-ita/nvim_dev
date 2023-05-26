local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/fidget.nvim' }

M.event = { "BufReadPre", "BufNewFile" }

M.config = function()
    local status, fidget = pcall(require, 'fidget')
    if not status then return end

    fidget.setup {
        text = {
            spinner = "dots", -- dots | line | dots_scrolling | star
        },
        window = {
            border = "rounded", -- single | double | shadow | rounded
        },
        sources = {
            ["null-ls"] = {
                ignore = true,
            },
        },
        timer = {
            spinner_rate = 40,
            fidget_decay = 0,
            task_decay = 0,
        },
    }
end

return M

-- https://github.com/j-hui/fidget.nvim
