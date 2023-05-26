local g = vim.g
local colorscheme = g.color_scheme or {
    test = false,
    name = 'nordic'
}
local namespace = g.namespace or 'pde_nvim'

local themeInstall = ''

if colorscheme.test then
	themeInstall = 'test.' .. colorscheme.name
else
	themeInstall = 'color-schemes.' .. colorscheme.name
end

local plugins = {
	-- color scheme
	themeInstall,

	-- language server protocol
	'lsp.lsp-config',
	'lsp.mason',

	-- completion
	'utils.completion',

	-- fuzzy find
	'utils.telescope',

	-- explorer
	-- 'utils.nvim-tree',
	'test.neo-tree',

	-- git
	'utils.gitsigns',
	-- 'test.diffview',

	-- ui ux
	'utils.dashboard',      -- dashboard
	'utils.bufferline',     -- tabulation
	'utils.lualine',        -- status line
	'utils.barbecue',       -- breadcrumbs
	'utils.nvim-web-devicons', -- icons

	-- terminal
	'utils.toggleterm',

	-- others helpers
	'utils.treesitter', -- code comprehension
	'utils.treesitter-context',
	'utils.tagbar',  -- tags
	'utils.which-key', -- keymaps
	'utils.comment', -- comment
	'utils.colorizer',
	'utils.autopairs',
	'utils.autotag',
	-- 'test.vim-startuptime',
	-- 'test.fidget',
	-- 'test.todo-comment',
	-- 'test.error-lens',
	-- 'test.neodev',

	-- dashboard
	-- require ( prefix_plugin .. 'startify' ),

	-- database
	-- require ( prefix_plugin .. 'dadbod' ),

	-- test
	-- require ( prefix_plugin .. 'vim-test' ),

	-- flutter
	-- require ( prefix_plugin .. 'flutter-tools' ),

	-- git
	-- require ( prefix_plugin .. 'vim-fugitive' ),require ( prefix_plugin ..

	-- comment
	-- require ( prefix_plugin .. 'neogen' ),

	-- fuzzy find
	-- require 'nvim-telescope/telescope-media-files.nvim',

	-- lsp suite
	-- require ( 'plugins.setup.coc' ),
	-- require ( 'plugins.setup.flutter-tools' ),
	-- require ( prefix_plugin .. 'lsp-lines' ),
	-- require ( prefix_plugin .. 'lightbulb' ),
	-- 'test.trouble',
	-- 'test.nvim-ufo',
	-- require ( prefix_plugin .. 'phpactor' ),
	-- require ( prefix_plugin .. 'code-action-menu' ),

	-- rest
	-- require ( 'plugins.setup.rest' ),

	-- others helpers
	-- require ( prefix_plugin .. 'indent-blankline' ),
	-- require ( prefix_plugin .. 'vim-illuminate' ),
	-- 'test.deadcolumn',
	-- require ( prefix_plugin .. 'twilight' ),
	-- require ( prefix_plugin .. 'repeat' ),
	-- require ( prefix_plugin .. 'vim-unimpaired' ),
	-- require ( prefix_plugin .. 'splitjoin' ),
	-- require ( namespace .. 'helpers.symbols-outline' ),			-- tags
	-- 'test.vim-illuminate',
	-- 'test.fine-cmdline',
	-- 'test.neoscroll',
	'test.mini',
	-- 'test.chatgpt',
	-- 'test.octo',
	-- 'test.neoclip',
	-- 'test.refactoring',
	-- 'test.indentline',
	'test.better-escape',
}

for key, value in pairs(plugins) do
	plugins[key] = require(namespace .. '.plugins.' .. value)
end

return plugins
