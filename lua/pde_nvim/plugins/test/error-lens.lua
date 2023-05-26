local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/error-lens.nvim' }

M.event = 'BufRead'

M.config = function ()
    local status, lens = pcall(require, 'error-lens')
    if not status then return end

    lens.setup {}
end

return M

-- https://github.com/chikko80/error-lens.nvim
-- https://www.reddit.com/r/neovim/comments/127m35b/errorlens_for_nvim/