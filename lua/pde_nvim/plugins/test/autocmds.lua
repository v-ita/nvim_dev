--[[
-- AUTO-COMMANDS
]]

-- auto install plugins on plugins file update
-- local group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
-- 	command = 'source <afile> | PackerSync',
-- 	pattern = 'install.lua',
-- 	group = group,
-- })

-- folding issue -- https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1159637962
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
--     pattern = { '*' },
--     command = 'normal zx',
-- })

-- show the inline diagnostics automatically in the hover window
-- not good as it block others dignostics popup to be shown
-- vim.cmd [[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false }) ]]

---Highlight yanked text
--
-- au('TextYankPost', {
--   group = ag('yank_highlight', {}),
--   pattern = '*',
--   callback = function()
--     vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
--   end,
-- })