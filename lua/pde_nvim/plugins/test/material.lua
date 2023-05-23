local status, material = pcall(require, 'material')
if not status then return end

material.setup {
	plugins = {
		-- 'dashboard',
		'gitsigns',
		'nvim-cmp',
		'nvim-tree',
		'nvim-web-devicons',
		'telescope',
		'trouble',
		'which-key'
	}
}