local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/vim-illuminate' }

M.config = function()
    local status, illuminate = pcall(require, 'illuminate')
    if not status then return end

    illuminate.configure {
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
    }

    -- vim.cmd([[
    --     hi link IlluminatedWordText Visual
    --     hi link IlluminatedWordRead Visual
    --     hi link IlluminatedWordWrite Visual
    --     hi MatchParen cterm=none gui=underline
    -- ]])
end

return M

-- https://github.com/RRethy/vim-illuminate
-- https://www.reddit.com/r/neovim/comments/12w89jd/vimilluminate_how_to_change_keybindings/