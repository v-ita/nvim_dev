local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/todo-comments.nvim' }

M.dependencies = { git .. '/plenary.nvim' }

-- M.config = function()
--     local status, todo = pcall(require, 'todo-comments')
--     if not status then return end

--     todo.setup {}
-- end

M.opts = {
    signs = true,    -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
        FIX = {
            icon = " ",                        -- icon used for the sign, and in search results
            color = "error",                      -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
}

return M

-- https://github.com/folke/todo-comments.nvim
