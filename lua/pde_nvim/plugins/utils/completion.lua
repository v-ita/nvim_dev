local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-cmp' }

M.dependencies = {
    { git .. '/cmp-nvim-lsp' }, -- only when lsp is enabled
    { git .. '/cmp-nvim-lua' },
    { git .. '/cmp-buffer' },
    { git .. '/cmp-path' },
    { git .. '/cmp-cmdline' },
    -- { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    -- { 'kristijanhusak/vim-dadbod-completion' },
}

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
        nvim_lsp = 'lsp', -- only if lsp is available
        nvim_lua = 'api',
        luasnip  = 'snippet', -- only if snippets is enabled
        buffer   = 'buffer',
        path     = 'path',
        cmdline  = 'cmd',
    }) do
        local spc = string.rep(' ', 7 - string.len (value))
        f_menu[key] = spc .. value
    end

    local sources = {
        { name = 'nvim_lsp' },    -- only if lsp is enabled
        { name = 'nvim_lua' },
        { name = 'luasnip' },     -- only if snippets is enabled
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