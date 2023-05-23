local settings_status, settings = pcall(require, 'settings')
if not settings_status then return end

local hl_status, utils = pcall(require, settings.namespace .. 'helpers.utils')
if not hl_status then return end

local map = utils.map
local git = settings.git

local M = { git .. '/rest.nvim' }

M.dependencies = { git .. '/plenary.nvim' }

M.ft = 'http'

M.config = function()
    local status, rest = pcall(require, 'rest-nvim')
    if not status then return end
    rest.setup {
        result = {
			show_url = false,
			show_headers = false,
		}
    }

    map('n', '<leader>rr', '<Plug>RestNvim<cr>', { desc = 'Rest client request' })
end

return M

-- https://github.com/rest-nvim/rest.nvim