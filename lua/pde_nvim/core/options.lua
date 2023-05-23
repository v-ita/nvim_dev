--[[
-- OPTIONS
]]

local o = vim.opt

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- encoding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = 'utf-8'

-- theme
o.termguicolors = true
o.background = 'dark'
o.syntax = 'on'

-- cursor
o.cursorline = true
o.cursorcolumn = false

-- line number
o.numberwidth = 4
o.number = true
o.relativenumber = true

-- mouse
o.mouse = 'a'
o.mousemoveevent = true -- used by bufferline plugin to show/hide close button

-- search
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.path:append { '**' }
o.wildignore:append { '*/node_modules/*' }

-- auto save
o.autowrite = true
o.updatetime = 250

-- undo
o.undofile = true

-- folding
o.foldenable = false
o.foldlevel = 3

-- copy/paste
o.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- tabulation
o.tabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.smartindent = true

-- text wrap
o.wrap = false
o.breakindent = true

-- scroll
o.scrolloff = 8
o.sidescrolloff = 8

-- tab split
o.splitbelow = true
o.splitright = true

-- popup
o.pumheight = 8
o.completeopt = 'menu,menuone,noselect,preview'

-- keymap
o.timeoutlen = 500 -- time in milliseconds to wait for a mapped sequence to complete (1000 by default)

-- command
o.laststatus = 0
o.cmdheight = 1 -- help hide :h hit-enter

-- spell
o.spelllang = 'en_us'
o.spell = true

-- indent-blankline
-- o.list = true
-- o.listchars:append "space:⋅"
-- o.listchars:append "eol:↴"

-- other
-- o.colorcolumn = 80