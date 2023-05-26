local g = vim.g
local git = g.git_username or 'taftadahir'
local namespace = g.namespace or 'pde_nvim'

local helpers_status, helpers = pcall(require, namespace .. '.helpers')
if not helpers_status then return end

local map = helpers.map

local M = { git .. '/nvim-cmp' }

M.dependencies = {
    {
        git .. '/cmp-nvim-lsp',
        event = { "BufReadPre", "BufNewFile" },
    }, -- only when lsp is enabled
    {
        git .. '/cmp-nvim-lua',
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        git .. '/cmp-buffer',
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        git .. '/cmp-path',
        event = { "BufReadPre", "BufNewFile" },
    },
    { git .. '/cmp-cmdline' },
    -- { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    -- { 'kristijanhusak/vim-dadbod-completion' },
    {
        git .. '/LuaSnip',
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        git .. '/friendly-snippets',
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        git .. '/cmp_luasnip',
        event = { "BufReadPre", "BufNewFile" },
    },
}

M.event = { "BufReadPre", "BufNewFile", 'VeryLazy' }

M.config = function()
    local cmp_status, cmp = pcall(require, 'cmp')
    if not cmp_status then return end

    -- local kind_icons = {
    --     Text = '',
    --     Method = 'm',
    --     Function = '',
    --     Constructor = '',
    --     Field = '',
    --     Variable = '',
    --     Class = '',
    --     Interface = '',
    --     Module = '',
    --     Property = '',
    --     Unit = '',
    --     Value = '',
    --     Enum = '',
    --     Keyword = '',
    --     Snippet = '',
    --     Color = '',
    --     File = '',
    --     Reference = '',
    --     Folder = '',
    --     EnumMember = '',
    --     Constant = '',
    --     Struct = '',
    --     Event = '',
    --     Operator = '',
    --     TypeParameter = '',
    -- }

    local setup = {}

    setup.mapping = cmp.mapping.preset.insert({
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-Space>'] = cmp.mapping.complete(),
        ['<c-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<cr>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
    })

    local f_menu = {}

    for key, value in pairs({
        nvim_lsp = 'lsp',     -- only if lsp is available
        nvim_lua = 'api',
        luasnip  = 'snippet', -- only if snippets is enabled
        buffer   = 'buffer',
        path     = 'path',
        cmdline  = 'cmd',
    }) do
        local spc = string.rep(' ', 7 - string.len(value))
        f_menu[key] = spc .. value
    end

    local sources = {
        { name = 'nvim_lsp' }, -- only if lsp is enabled
        { name = 'nvim_lua' },
        { name = 'luasnip' },  -- only if snippets is enabled
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        -- { name = 'nvim_lsp_signature_help' },
        -- { name = 'vim-dadbod-completion' },
    }

    -- only if snippets is enabled
    local snip_status, luasnip = pcall(require, 'luasnip')
    if snip_status then
        setup.snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        }

        -- require('luasnip.loaders.from_vscode').load({ paths = { vim.fn.stdpath('data') .. '/site/pack/packer/start/friendly-snippets' } })
        -- require('luasnip.loaders.from_vscode').load({ paths = { vim.fn.stdpath('data') .. '/lazy/friendly-snippets' } })
        -- require("luasnip.loaders.from_vscode").lazy_load()

        luasnip.config.set_config({
            history = true,
            enable_autosnippets = true
        })

        map({ 'i', 's' }, '<c-n>', "<cmd>lua require'luasnip'.jump(1)<cr>", { desc = 'Snippet jump next' })
        map({ 'i', 's' }, '<c-p>', "<cmd>lua require'luasnip'.jump(-1)<cr>", { desc = 'Snippet jump previous' })
    end

    setup.formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, vim_item)
            -- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            vim_item.kind = ' '
            vim_item.menu = (f_menu)[entry.source.name]
            return vim_item
        end
    }

    setup.confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    }

    setup.experimental = {
        ghost_text = false, -- issue enabling this
        native_menu = false,
    }

    setup.window = {
        documentation = cmp.config.window.bordered(),
    }

    setup.sources = cmp.config.sources(sources)

    -- setup.sorting = {
    -- 	comparators = {
    -- 		cmp.config.compare.offset,
    -- 		cmp.config.compare.exact,
    -- 		cmp.config.compare.score,
    -- 		-- require "cmp-under-comparator".under,
    -- 		cmp.config.compare.kind,
    -- 		cmp.config.compare.sort_text,
    -- 		cmp.config.compare.length,
    -- 		cmp.config.compare.order,
    -- 	},
    -- }

    cmp.setup(setup)

    -- cmp.setup.filetype('gitcommit', {
    --     sources = cmp.config.sources({
    --         { name = 'cmp_git' },
    --     }, {
    --         { name = 'buffer' },
    --     })
    -- })

    -- cmp.setup.cmdline({ '/', '?' }, {
    --     mapping = cmp.mapping.preset.cmdline(),
    --     sources = {
    --         { name = 'buffer' }
    --     }
    -- })

    -- cmp.setup.cmdline(':', {
    --     mapping = cmp.mapping.preset.cmdline(),
    --     sources = cmp.config.sources({
    --         { name = 'path' }
    --     }, {
    --         { name = 'cmdline' }
    --     })
    -- })
end

return M

-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-nvim-lua
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/saadparwaiz1/cmp_luasnip
