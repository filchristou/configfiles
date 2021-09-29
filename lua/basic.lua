-- vim.cmd -> to execute Vim commands e.g. cmd('pwd')
-- vim.fn -> to call Vim functions e.g. fn.bufnr()
-- vim.g -> a table to access global variables
-- vim.opt -> to set options

require('support')

vim.g.mapleader = "-"
vim.g.maplocalleader = "\\"


------------- set options -------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4 
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 99

vim.g.xml_syntax_folding = 1

------------- mappings -------------
map('n', '<Space>', 'a<Space><Esc>')
map('n', '=', 'o<Esc>')
map('n', '+', 'O<Esc>')
map('n', '<leader>hn', ':noh<CR>')
-- scroll left or right
map('n', ']', 'zlzlzl')
map('n', ']', 'zhzhzh')
--move splits
map('n', '<C-H>', '<C-W><')
map('n', '<C-J>', '<C-W>-')
map('n', '<C-K>', '<C-W>+')
map('n', '<C-L>', '<C-W>>')

--copy	(reg x)
map('n', '<C-c>', 'ma0v$h"xy`a')
map('v', '<C-c>', '"xy')
--cut	(reg x)
map('n', '<C-x>', 'ma0v$h"xx`a')
map('v', '<C-x>', '"xx')
--paste (reg x)
map('n', '<C-v>', '"xp')
map('v', '<C-v>', '"xp')
map('i', '<C-v>', '<Esc>"xpa')
map('n', '<C-V>', '"xP')
map('v', '<C-V>', '"xP')
map('i', '<C-V>', '<Esc>"xPa')
--select line without newline
map('n', '<leader>v', '0v$h')
--copy word		(reg c)
map('n', '<leader>y', 'ma"cyiw`a')
map('v', '<leader>y', '"cy')
--cut word		(reg c)
map('n', '<leader>x', 'ma"cxiw`a')
map('v', '<leader>x', '"cx')
--paste word	(reg c)
map('n', '<leader>p', '"cp')
map('n', '<leader>P', '"cP')
--replace word	(reg c)
map('n', '<leader>r', 'diw"cp')
map('n', '<leader>R', 'diw"cP')
--delete word and write
map('n', '<leader>c', 'lbvec')

--empty line
map('n', '<leader>d', '0D')
--handle buffers
map('n', '<leader>1', ':buffer 1<CR>')
map('n', '<leader>2', ':buffer 2<CR>')
map('n', '<leader>3', ':buffer 3<CR>')
map('n', '<leader>4', ':buffer 4<CR>')
map('n', '<leader>5', ':buffer 5<CR>')
map('n', '<leader>6', ':buffer 6<CR>')
map('n', '<leader>7', ':buffer 7<CR>')
map('n', '<leader>8', ':buffer 8<CR>')
map('n', '<leader>9', ':buffer 9<CR>')
--switch buffers
map('n', '<C-n>', ':bn<CR>')
map('n', '<C-p>', ':bp<CR>')

--function keys
map('n', '<F1>', ':set relativenumber!<CR>:set relativenumber?<CR>')
map('n', '<F2>', ':set list!<CR>:set list?<CR>')

--wrap visual
map('v', "'", "<ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll")

--diff
map('n', '<C-f><C-f>', ':w !diff --color % -<CR>')
--searching
map('v', '*', '"vyma:%s/<C-R>v//gn<CR>`a')
--saving file
map('n', '<C-S>', ':w<CR>')
map('i', '<C-S>', '<ESC>:w<CR>a')

