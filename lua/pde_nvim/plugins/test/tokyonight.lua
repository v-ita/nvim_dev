local status, tokyonight = pcall(require, 'tokyonight')
if not status then return end

tokyonight.setup {
	style = 'storm',  -- storm, moon, night
}