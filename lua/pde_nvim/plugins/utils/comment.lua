local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-comment' }

M.dependencies = {
	{ git .. '/nvim-ts-context-commentstring' }
}

M.event = 'VeryLazy'

M.config = function()
	local status, comment = pcall(require, 'nvim_comment')
	if not status then return end

	comment.setup {
		comment_empty = false,
		hook = function()
			-- if vim.api.nvim_buf_get_option(0, 'filetype') == 'vue' or vim.api.nvim_buf_get_option(0, 'filetype') == 'php' then
			require('ts_context_commentstring.internal').update_commentstring()
			-- end
		end
	}
end

return M

-- https://github.com/terrortylor/nvim-comment
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

-- comment cheat sheet
-- gcc : toggle line comment
-- gc{count}{motion} : toggle multi-lines comment
-- gc{motion} : toggle comment selection defined by motion