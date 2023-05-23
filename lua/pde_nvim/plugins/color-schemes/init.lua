local g = vim.g
local colorscheme = g.color_scheme or 'gruvbox'

local colorscheme_status, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not colorscheme_status then
	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	vim.cmd [[ colorscheme default ]]
end

-- vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi LineNr guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi SignColumn guibg=NONE ctermbg=NONE ]]
-- vim.cmd [[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]]