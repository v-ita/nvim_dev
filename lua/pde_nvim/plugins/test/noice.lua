return {
  'folke/noice.nvim',
  requires = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify'
  }
}

-- local status, noice = pcall(require, 'noice')
-- if not status then return end

-- noice.setup({
-- 	cmdline = {
-- 		view = 'cmdline', -- cmdline_popup, cmdline
-- 	},
-- })