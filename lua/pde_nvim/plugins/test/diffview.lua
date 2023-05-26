local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/diffview.nvim' }

M.event = 'VeryLazy'

M.keys = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh', 'DiffviewFileHistory' }

return M

-- https://github.com/sindrets/diffview.nvim