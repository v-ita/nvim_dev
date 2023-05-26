local g = vim.g
local colorscheme = g.color_scheme or {
    test = false,
    name = 'nordic'
}

local colorscheme_status, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme.name)
if not colorscheme_status then
	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	vim.cmd [[ colorscheme default ]]
end

-- vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi LineNr guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi SignColumn guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]]

-- vim.cmd[[
-- 	" Set colorcolumn's color to slightly lighter than my background
-- 	" so that it is visible but not an eyesore.
-- 	highlight ColorColumn ctermbg=235 guibg=#000000
-- ]]