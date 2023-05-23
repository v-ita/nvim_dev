--[[
-- MAPS
]]

local g = vim.g
local namespace = g.namespace or 'pde_nvim'

local helpers_status, helpers = pcall(require, namespace .. '.helpers')
if not helpers_status then return end

local map = helpers.map

-- leaders
-- remap space as leader key
map('', '<space>', '<nop>', { desc = 'Unmap space' })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- buffer
map('n', '<c-s>', ':w<cr>', { desc = 'Save buffer' })
map('n', '<s-q>', ':bd<cr>', { desc = 'Quit buffer' }) -- <c-q> <leader>Q
-- map('n', '<s-q>', ':q<cr>', { desc = 'Quit buffer' }) -- <c-q> <leader>Q

-- easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<esc>A;<esc>', { desc = 'Add ;; at the end of line' })
map('i', ',,', '<esc>A,<esc>', { desc = 'Add , at the end of line' })

-- press jk fast to enter
map('i', 'jk', '<esc>', { desc = 'Exit insert mode' })

-- exit neovim
map({ 'i', 'v', 'n' }, '<c-q>', '<cmd>qa<cr>', { desc = 'Exit Neovim' })

-- highlight
map('n', '<leader>h', ':noh<cr>', { desc = 'Disable highlight' }) -- <leader>h <leader>k <esc>

-- selection
map('n', '<c-a>', 'gg<s-v>G', { desc = 'Select all' })

-- do not yank/copy with x
-- map('n', 'x', '"_x', { desc = 'Cut char' }) -- this disable the transpose xp

-- swap lines
map('n', '<c-k>', ':m-2<cr>', { desc = 'Move line up' })
map('n', '<c-j>', ':m+1<cr>', { desc = 'Move line down' })

-- tabulation

-- window navigation
map('n', '<c-w>', '<c-w>w', { desc = 'Change focused window to the next' }) -- <c-w>w <leader>w

-- window split
map('n', '<leader>sh', ':split<cr><c-w>w', { desc = 'Split horizontally' }) -- leader wsh
map('n', '<leader>sv', ':vsplit<cr><c-w>w', { desc = 'Split vertically' })  -- leader wsv

-- window resize
map('n', '<c-up>', ':resize +2<cr>', { desc = 'Enlarge height' })
map('n', '<c-down>', ':resize -2<cr>', { desc = 'Diminish height' })
map("n", "<c-left>", ":vertical resize -2<cr>", { desc = 'Diminish width' })
map("n", "<c-right>", ":vertical resize +2<cr>", { desc = 'Enlarge width' })


------------------------- default cheat sheet -------------------------

--[[ help
-- :h[elp] keyword : open help for keyword
-- K : open man page under cursor
]]

--[[ navigation/movement
-- h    : move cursor left
-- j    : move cursor down
-- k    : move cursor up
-- l    : move cursor right
-- H    : move to top of screen
-- M    : move to middle of screen
-- L    : move to bottom of screen
-- w    : jump forwards to the start of a word
-- W    : jump forwards to the start of a word (word can contain ponctuation)
-- e    : jump forwards to the end of a word
-- E    : jump forwards to the end of a word (word can contain ponctuation)
-- b    : jump backwards to the start of a word
-- B    : jump backwards to the start of a word (word can contain ponctuation)
-- ge   : jump backwards to the end of a word
-- gE   : jump backwards to the end of a word (word can contain ponctuation)
-- %    : move to matching character ((), {}, []) - find help by [:h matchpairs]
-- 0    : jump to the start of the line
-- ^ or 0w : jump to the first non-blank character of the line
-- $    : jump to the end of the line
-- gg   : go to first line in the document
-- G    : go to last line in the document
-- 5gg or 5G : go to line 5
-- gd   : move to local declaration
-- gD   : move to global declaration
-- fx   : jump to next occurrence of character x
-- tx   : jump to before next occurrence of character x
-- Fx   : jump to previous occurrence of character x
-- Tx   : jump to before previous occurrence of character x
-- }    : jump to next paragraph(or function/block, when editing)
-- {    : jump to previous paragraph(or function/block, when editing)
-- zz   : center cursor on screen
-- zt   : position cursor on top of the screen
-- zb   : position cursor on bottom of the screen
-- <c-e> : move screen down one line(without moving cursor)
-- <c-y> : move screen up one line(without moving cursor)
-- <c-b> : move back full screen
-- <c-f> : move forward full screen
-- <c-d> : move forward 1/2 a screen
-- <c-u> : move back 1/2 a screen
-- : #  : go to # line
]]

--[[ insert mode
-- i    : insert before the cursor
-- I    : insert at the beginning of the line
-- a    : insert(append) after the cursor
-- A    : insert(append) at the end of the line
-- o    : append(open) a new line below the current line
-- O    : append(open) a new line above the current line
-- ea   : insert(append) at the end of the word
-- <c-h> : delete character before the cursor during insert mode
-- <c-w> : delete word before cursor during insert mode
-- <c-t> : indent(move right) line one shiftwidth during insert mode
-- <c-d> : de-indent(move left) line one shiftwidth during insert mode
-- <c-n> : insert(auto-complete) next match before the cursor during insert mode
-- <c-p> : insert(auto-complete) previous match before the cursor during insert mode
-- <esc> or <c-[> : exit insert  mode
]]

--[[ editing
-- r [char] : replace a single character with [char]
-- R    : replace more then one character until <esc>
-- J    : join line below to current line with one space in between
-- gJ   : join line below to current line without a space in between
-- g~   : switch case up to motion
-- gu   : change to lowercase up to motion
-- gU   : change to uppercase up to motion
-- cc   : change(replace) entire line
-- c$ or C : change(replace) to the end of line
-- ciw  : change(replace) entire word
-- ce or cw : change(replace) to the end of the word
-- s    : delete character and substitute text
-- S    : delete line and substitute text (same as cc)
-- xp   : transpose two letters (delete and paste)
-- u    : undo
-- U    : restore(undo) last changed line
-- <c-r> : redo
-- .    : repeat last command
]]

--[[ macros
-- qa   : record macro a
-- q    : stop recording a macro
-- @a   : run macro a
-- @@   : rerun last run macro
]]

--[[ cut and paste
-- yy   : yank(copy) a line
-- yw   : yank the characters of word from the cursor position to the start of the next word
-- yiw  : yank word under cursor
-- yaw  : yank word under cursor and the space before or after it
-- y$ or Y : yank to the end of line
-- x    : delete(cut) character under cursor
-- X    : delete(cut) previous character
-- p    : put(paste) the clipboard after cursor
-- P    : put(paste) before the cursor
-- dd   : delete(cut) a line
-- dw   : delete(cut) the characters of word from the cursor position to the start of the next word
-- diw  : delete word under cursor
-- daw  : delete word under cursor and the space before or after it
-- :2,5d : delete lines starting from 3 to 5
]]

--[[ indent
-- >>   : indent line one shiftwidth
-- <<   : de-indent line one shiftwidth
-- >%   : indent a block with () or {}(cursor on brace)
-- <%   : de-indent a block with () or {}(cursor on brace)
]]

--[[ search and replace
-- /pattern : search for pattern
-- ?pattern : search backwards for a pattern
-- n    : repeat search in the same direction
-- N    : repeat search in the opposite direction
-- :%s/old/new/g : replace all old with new throughout file
-- :%s/old/new/gc : replace all old with new throughout file with confirmations
-- :noh : remove highlight of search matches
]]

--[[ search in multiple files
-- :vimgrep /pattern/ {`{file}`} : search for pattern in multiple file [e.g. vimgrep /foo/ **/*]
-- cn[ext] : jump to the next match
-- cp[revious] : jump to the previous match
-- cope[n] : open a new window containing the lists of matches
-- ccl[ose] : close the quickfix window
]]

--[[ marks
-- m{a-zA-Z} : set mark {a-zA-Z} at cursor position. a capital mark sets a global mark between files
-- `{a-z} : move the cursor to the start of the line where the mark was set
]]

--[[ diff
-- zf : manually define a fold up to motion
-- zd : delete fold under cursor
-- za : toggle fold under the cursor
-- zo : open fold under the cursor
-- zc : close fold under the cursor
-- zr : reduce(open) all folds by one level
-- zm : fold more(close) all folds by one level
-- zi : toggle folding functionality
-- ]c : jump to start of next change
-- [c : jump to start of previous change
-- do or :diffg[et] : obtain(get) difference (from other buffer)
-- dp or :diffpu[t] : put difference (to other buffer)
-- :diffthis : make current window part of diff
-- :dif[fupdate] : update differences
-- :diffo[ff] : switch off diff mode for current window
]]

--[[ tabulation
-- :tabnew or tabnew {page.word.file} : open a file in a new tab
-- <c-w>T : move the current split window to it's own tab
-- gt or :tabn[ext] : move to the next tab
-- gT or :tabp[revious] : move to the previous tab
-- #gt : move to tab number #
-- :tabe[dit] : make a new tab
-- :tabm[ove] # : move tab current tab to the #th position(indexed from 0)
-- :tabc[lose] : close the current tab and all it's window
-- :tabo[nly] : close all others tabs except for the current
]]

--[[ buffer
-- :e[dit] file : edit a file in a new buffer
-- :bn[ext] : go to the next buffer
-- :bp[revious] : go to the previous buffer
-- :bd[elete] : delete a buffer(close a file)
-- :b[uffer] # : go to buffer by index #
-- :sp[lit] file : open a file in a new buffer and split window
-- :vsp[lit] file : open a file in a new buffer and vertically split window
-- <c-w>H : make current window full height at far left(leftmost vertical window)
-- <c-w>L : make current window full height at far right(rightmost vertical window)
-- <c-w>J : make current window full width at the very bottom(bottommost horizontal window)
-- <c-w>K : make current window full width at the very top(topmost horizontal window)
]]

--[[ exiting
-- :w   : write(save) the file butdon't quit
-- :wq  : write(save) and quit
-- :q   : quit(fail if there are changes)
-- :q!  : quit and throw all changes
]]

--[[ operators
-- d    : delete from the cursor to the movement location
-- c    : delete(cut) from the cursor to the movement location, then starts insert mode
-- y    : copy from the cursor to the movement location
-- >    : indent one level
-- <    : unindent one level
]]

--[[
-- z=   : spell correction for word under cursor
-- :spellr : repeat last spell correction for all words
-- :zg: add word under cursor as a new correct word
]]

-- [vim.rtorr](https://vim.rtorr.com/)
-- [vimsheet](https://vimsheet.com/)