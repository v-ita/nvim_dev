local settings_status, settings = pcall(require, 'settings')
if not settings_status then return end

local git = settings.git

local M = { git .. '/neosolarized.nvim' }

M.dependencies = {
	git .. '/colorbuddy.nvim'
}

M.config = function ()
    local neo_status, neosolarized = pcall(require, 'neosolarized')
    if not neo_status then return end

    neosolarized.setup({ comment_italics = true })
end

-- indent-blankline plugin
vim.cmd [[highlight IndentBlanklineIndent1 guibg=none gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#012934 gui=nocombine]]

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

return M

-- https://github.com/svrana/neosolarized.nvim