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
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

au('TextYankPost', {
  group = ag('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  end,
})

-- vim.cmd[[
--     " set to 100 in kotlin file
--     autocmd filetype kotlin setlocal colorcolumn=100
-- ]]

-- vim.cmd[[
--     " Only show the colorcolumn in the current window.
--     autocmd WinLeave * set colorcolumn=0
--     autocmd WinEnter * set colorcolumn=+0
-- ]]

---

-- local function augroup(name)
--     return vim.api.nvim_create_augroup("thorre_" .. name, { clear = true })
-- end

-- Check if we need to reload the file when it changed
-- vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
--     group = augroup("checktime"),
--     command = "checktime",
-- })

-- Highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
--     group = augroup("highlight_yank"),
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })

-- resize splits if window got resized
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--     group = augroup("resize_splits"),
--     callback = function()
--         vim.cmd("tabdo wincmd =")
--     end,
-- })

-- go to last loc when opening a buffer
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     group = augroup("last_loc"),
--     callback = function()
--         local mark = vim.api.nvim_buf_get_mark(0, '"')
--         local lcount = vim.api.nvim_buf_line_count(0)
--         if mark[1] > 0 and mark[1] <= lcount then
--             pcall(vim.api.nvim_win_set_cursor, 0, mark)
--         end
--     end,
-- })

-- close some filetypes with <q>
-- vim.api.nvim_create_autocmd("FileType", {
--     group = augroup("close_with_q"),
--     pattern = {
--         "qf",
--         "help",
--         "man",
--         "notify",
--         "lspinfo",
--         "spectre_panel",
--         "startuptime",
--         "tsplayground",
--         "PlenaryTestPopup",
--         "Git",
--         "checkhealth",
--     },
--     callback = function(event)
--         vim.bo[event.buf].buflisted = false
--         vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
--     end,
-- })

-- wrap and check for spell in text filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--     group = augroup("wrap_spell"),
--     pattern = { "gitcommit", "markdown" },
--     callback = function()
--         vim.opt_local.wrap = true
--         vim.opt_local.spell = true
--     end,
-- })

---

-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     pattern = "*",
--     command = "set nopaste",
-- })

-- Format options ,no help with comments :-)
-- vim.cmd([[ autocmd FileType * set formatoptions-=cro ]])

-- Format on save can be setup for all LSP servers 
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
