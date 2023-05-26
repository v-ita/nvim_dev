local g = vim.g
local git = g.git_username or 'taftadahir'

local M = { git .. '/nvim-autopairs' }

M.config = function()
    local status, npairs = pcall(require, 'nvim-autopairs')
    if not status then return end
    local Rule = require 'nvim-autopairs.rule'
    local ts_conds = require 'nvim-autopairs.ts-conds'

    npairs.setup({
        check_ts = true,
        disable_filetype = { 'TelescopePrompt' },
        -- ts_config = {
        --     lua = { "string" },                 -- don't add pairs in lua string treesitter nodes
        --     javascript = { "template_string" }, -- don't add pairs in javascript template string treesitter nodes
        --     java = false,                       -- don't check treesitter on java
        -- },
    })

    npairs.add_rules {
        Rule('{{', '  }', 'vue')
            :set_end_pair_length(2)
            :with_pair(ts_conds.is_ts_node 'text'),
    }

    -- require nvim-autopairs completion
    local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if not cmp_autopairs_setup then
        return
    end

    -- require cmp
    local cmp_setup, cmp = pcall(require, "cmp")
    if not cmp_setup then
        return
    end

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M

-- https://github.com/windwp/nvim-autopairs
