--[[
-- ENTRY POINT
]]

pcall(require, 'settings')

local g = vim.g
local namespace = g.namespace or 'pde_nvim'

for _, module in pairs(require(namespace)) do
	pcall(require, namespace .. '.' .. module)
end