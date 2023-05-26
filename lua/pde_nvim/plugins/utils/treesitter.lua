local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-treesitter' }

M.build = ':TSUpdate'

-- http parser have issue
-- this resolve it
-- https://github.com/rest-nvim/rest.nvim/issues/191
M.commit = 'eedc5198a1b4bb1b08ae6d4f64f3d76e376957aa'

M.dependencies = {
	{ git .. '/nvim-ts-rainbow' },
}

M.lazy = true

M.cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSEnable', 'TSDisable', 'TSModuleInfo', 'TSUpdate' }

M.config = function()
	local status, treesitter = pcall(require, 'nvim-treesitter.configs')
	if not status then return end

	local ensure_installed = { "astro", 'bash', 'comment', 'css', 'dart', 'diff', 'html', 'http', 'javascript', 'jsdoc',
		'json', "json5", 'gitattributes', 'gitcommit', 'gitignore', "graphql", 'lua', 'markdown', 'php', 'phpdoc',
		"prisma", 'scss', 'sql', "svelte", "tsx", "typescript", 'vim', 'vue', 'yaml' }
	local ignore_install = {}

	local setup = {
		ensure_installed = ensure_installed,
		sync_install = true,
		auto_install = true,
		ignore_install = ignore_install,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
			disable = { 'NvimTree' }
		},
		indent = {
			enable = true
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil
		},
	}

	-- setup.textobjects = {
	-- 	move = {
	-- 		enable = true,
	-- 		set_jumps = true, -- whether to set jumps in the jumplist
	-- 		goto_next_start = {
	-- 			["]]"] = "@function.outer",
	-- 			["]m"] = "@class.outer",
	-- 		},
	-- 		goto_next_end = {
	-- 			["]["] = "@function.outer",
	-- 			["]M"] = "@class.outer",
	-- 		},
	-- 		goto_previous_start = {
	-- 			["[["] = "@function.outer",
	-- 			["[m"] = "@class.outer",
	-- 		},
	-- 		goto_previous_end = {
	-- 			["[]"] = "@function.outer",
	-- 			["[M"] = "@class.outer",
	-- 		},
	-- 	},
	-- 	select = {
	-- 		enable = true,

	-- 		-- Automatically jump forward to textobj, similar to targets.vim
	-- 		lookahead = true,

	-- 		keymaps = {
	-- 			-- You can use the capture groups defined in textobjects.scm
	-- 			["af"] = "@function.outer",
	-- 			["if"] = "@function.inner",
	-- 			["ac"] = "@class.outer",
	-- 			["ic"] = "@class.inner",
	-- 		},
	-- 	},
	-- 	swap = {
	-- 		enable = true,
	-- 		swap_next = {
	-- 			["~"] = "@parameter.inner",
	-- 		},
	-- 	},
	-- }

	-- setup.textsubjects = {
	-- 	enable = true,
	-- 	keymaps = {
	-- 		['<cr>'] = 'textsubjects-smart', -- works in visual mode
	-- 	}
	-- }

	-- only when ts_context_commentstring is installed
	local ts_status, _ = pcall(require, 'ts_context_commentstring')
	if ts_status then
		setup.context_commentstring = {
			enable = true,
			enable_autocmd = false,
			config = {
				css = '/* %s */',
				html = '<!-- %s -->',
				javascript = '// %s',
				php = '# %s',
				lua = '-- %s',
				sql = '-- %s',
			}
		}
	end

	-- only when nvim-autopairs is installed
	local npairs_status, npairs = pcall(require, 'nvim-autopairs')
	if npairs_status then
		npairs.autopairs = {
			enable = true
		}
	end

	treesitter.setup(setup)
end

local o = vim.opt

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false

-- vim.api.nvim_exec([[
-- 	set foldmethod = expr " expr, manual, suntax, indent, marker, diff
-- 	set foldexpr = nvim_treesitter#foldexpr()
-- 	" set nofoldenable
-- ]], true)

return M

-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/plugins/treesitter.lua
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
