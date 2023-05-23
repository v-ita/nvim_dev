local status, neon = pcall(require, 'neon')
if not status then return end

neon.setup {
	neon_style = 'doom', -- default, doom, dark, light
	neon_italic_comment = true,
	neon_italic_keyword = true,
	neon_italic_boolean = true,
	neon_italic_function = true,
	neon_italic_variable = true
}