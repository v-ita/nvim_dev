local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/lspsaga.nvim' }

M.event = { "BufReadPost", "BufNewFile", "LspAttach" }

M.cmd = "Lspsaga"

M.config = function()
    require("lspsaga").setup({})
end

M.dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" }
}

return M

-- https://github.com/nvimdev/lspsaga.nvim