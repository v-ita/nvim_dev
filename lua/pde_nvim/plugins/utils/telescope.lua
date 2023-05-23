local g = vim.g
local git = g.git_username or 'taftadahir'
local namespace = g.namespace or 'pde_nvim'

local helpers_status, helpers = pcall(require, namespace .. '.helpers')
if not helpers_status then return end

local map = helpers.map

local M = { git .. '/telescope.nvim' }

M.dependencies = {
    -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    -- { 'nvim-telescope/telescope-media-files.nvim' },
    { git .. '/plenary.nvim' },
    -- { git .. '/nvim-web-devicons', opt = true },
}

M.config = function()
    local tel_status, telescope = pcall(require, 'telescope')
    local action_status, actions = pcall(require, 'telescope.actions')

    if not tel_status or not action_status then return end

    -- fold issue: folding don't work because we leave telescope at insert mode
    -- solution: https://github.com/nvim-telescope/telescope.nvim/issues/559
    local function stopinsert(callback)
        return function(prompt_bufnr)
            vim.cmd.stopinsert()
            vim.schedule(function() callback(prompt_bufnr) end)
        end
    end

    -- vim.cmd([[
    -- 	highlight link TelescopePromptTitle PMenuSel
    -- 	highlight link TelescopePreviewTitle PMenuSel
    -- ]])

    local mappings = {
        i = {
            ['<c-c>'] = actions.close,
            ['<c-j>'] = actions.move_selection_next,
            ['<c-k>'] = actions.move_selection_previous,
            ['<c-_>'] = actions.which_key,
            ['<c-u>'] = actions.preview_scrolling_up,
            ['<c-d>'] = actions.preview_scrolling_down,
            ['<cr>'] = stopinsert(actions.select_default),
        },
        n = {
            ['<esc>'] = actions.close,
            ['<cr>'] = stopinsert(actions.select_default),
            ['j'] = actions.move_selection_next,
            ['k'] = actions.move_selection_previous,
            ['gg'] = actions.move_to_top,
            ['G'] = actions.move_to_bottom,
            ['<PageUp>'] = actions.results_scrolling_up,
            ['<PageDown>'] = actions.results_scrolling_down,
            ['<c-u>'] = actions.preview_scrolling_up,
            ['<c-d>'] = actions.preview_scrolling_down,
            ['?'] = actions.which_key,
        }
    }

    local theme_name = nil -- ivy, dropdown, cursor, nil
    local layout_config = {
        width = .9,
        height = .75,
        prompt_position = 'bottom', -- bottom, top
        -- 	mirror = false,
        preview_width = .5
    }

    -- telescope.load_extension('media_files')
    -- telescope.load_extension('flutter')
    -- telescope.load_extension('noice')

    telescope.setup {
        defaults = {
            -- previewer = true,
            mappings = mappings,
            -- path_display = { truncate = 1 },
            -- prompt_prefix = '   ',
            -- selection_caret = '  ',
            sorting_strategy = 'descending', -- ascending, descending
            file_ignore_patterns = {
                '.git/',
                'node_modules',
                'vendor',
            },
            layout_config = layout_config
        },
        pickers = {
            colorscheme = {
                theme = theme_name,
            },
            live_grep = {
                theme = theme_name,
                -- layout_config = layout_config
            },
            find_files = {
                theme = theme_name,
                -- layout_config = layout_config,
                -- hidden = true,
            },
            -- buffers = {
            -- 	theme = theme_name,
            -- 	previewer = false,
            -- 	layout_config = {
            -- 		width = 80,
            -- 	},
            -- },
            -- help_tags = {
            -- 	theme = theme_name
            -- },
            git_commits = {
                theme = theme_name,
                -- layout_config = layout_config
            },
            -- git_files = {
            -- 	theme = theme_name
            -- },
            grep_string = {
                theme = theme_name,
                -- layout_config = layout_config
            },
            -- media_files = {
            -- 	theme = theme_name
            -- },
            -- oldfiles = {
            -- 	theme = theme_name
            -- },
            -- diagnostics = {
            -- 	theme = theme_name
            -- },
            -- lsp_references = {
            -- 	theme = theme_name,
            -- 	-- previewer = false,
            -- },
            -- lsp_type_definitions = {
            -- 	theme = theme_name
            -- },
            -- lsp_definitions = {
            -- 	theme = theme_name
            -- },
            -- lsp_implementations = {
            -- 	theme = theme_name
            -- },
            -- commands = {
            -- 	theme = theme_name
            -- },
        },
        -- extensions = {
        -- 	media_files = {
        -- 		filetypes = { 'png', 'webp', 'jpg', 'jpeg', },
        -- 		find_cmd = 'rg',
        -- 	},
        -- 	fzf = {
        -- 		fuzzy = true
        -- 	}
        -- },
    }

    -- local builtin_status, builtin = pcall(require, 'telescope.builtin')

    -- if builtin_status then
    --     map('n', '<leader>fc', builtin.git_commits, { desc = 'Git commit' })
    --     map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    --     map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    --     map('n', '<leader>fs', builtin.grep_string, { desc = 'Grep string' }) -- search word under cursor
    --     map('n', '<leader>ft', builtin.colorscheme, { desc = 'Switch colorscheme' })


    --     -- map('n', '<leader>fa', builtin.commands, { desc = 'All available commands' })
    --     -- map('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    --     -- map('n', '<leader>fgf', builtin.git_files, { desc = 'Git files' })
    --     -- map('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' }) -- <leader>ft
    --     -- map('n', '<leader>fo', builtin.oldfiles, { desc = 'Old files' })
    --     -- map('n', '<leader>fp', '<cmd>Telescope projects<cr>', { desc = 'Projects' })
    --     -- map('n', '<leader>fm', ':lua require('telescope').extensions.media_files.media_files()<cr>',
    --     -- 	{ desc = 'Media files' })
    -- end

    -- telescope.load_extension('fzf')
    -- telescope.load_extension('media_files')
end

M.keys = {
    { '<leader>fc', ":lua require('telescope.builtin').git_commits", desc = 'Git commit' },
    { '<leader>ff', ":lua require('telescope.builtin').find_files",  desc = 'Find files' },
    { '<leader>fg', ":lua require('telescope.builtin').live_grep",   desc = 'Live grep' },
    { '<leader>fs', ":lua require('telescope.builtin').grep_string", desc = 'Grep string' },
    { '<leader>ft', ":lua require('telescope.builtin').colorscheme", desc = 'Switch colorscheme' }
}

M.cmd = 'Telescope'

return M

-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-lua/plenary.nvim
-- https://github.com/nvim-tree/nvim-web-devicons
-- https://github.com/nvim-telescope/telescope-media-files.nvim
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
