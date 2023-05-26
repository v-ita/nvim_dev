local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nightfox.nvim' }

M.config = function()
    local status, nightfox = pcall(require, 'nightfox')
    if not status then return end

    nightfox.setup {
        options = {
            -- Compiled file's destination location
            -- compile_path = vim.fn.stdpath("cache") .. "/nightfox",
            -- compile_file_suffix = "_compiled", -- Compiled file suffix
            --     transparent = false,       -- Disable setting background
            --     terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            --     dim_inactive = false,      -- Non focused panes set to alternative background
            --     module_default = true,     -- Default enable value for modules
            --     colorblind = {
            --         enable = false,        -- Enable colorblind support
            --         simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            --         severity = {
            --             protan = 0,        -- Severity [0,1] for protan (red)
            --             deutan = 0,        -- Severity [0,1] for deutan (green)
            --             tritan = 0,        -- Severity [0,1] for tritan (blue)
            --         },
            --     },
            -- styles = {
            --     boolean = "italic",
            --     comments = "italic",
            --     conditionals = "italic,bold",
            --     constants = "bold",
            --     functions = "bold",
            --     keywords = "bold",
            --     numbers = "NONE",
            --     operators = "NONE",
            --     strings = "NONE",
            --     types = "italic,bold",
            --     variables = "NONE",
            --   },
            --     inverse = {
            --         -- Inverse highlight for different types
            --         match_paren = false,
            --         visual = false,
            --         search = false,
            --     },
            -- modules = {
            --     "alpha",
            --     "cmp",
            --     "fidget",
            --     "gitgutter",
            --     "gitsigns",
            --     "lsp_saga",
            --     "nvimtree",
            --     "pounce",
            --     "symbol_outline",
            --     "telescope",
            --     "treesitter",
            --     "trouble",
            --     "whichkey",
            --   },
            -- },
            -- palettes = {},
            -- specs = {},
            -- groups = {},
        }
    }
end

return M

-- https://github.com/EdenEast/nightfox.nvim
