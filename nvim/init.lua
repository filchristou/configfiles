-- vim.cmd -> to execute Vim commands e.g. cmd('pwd')
-- vim.fn -> to call Vim functions e.g. fn.bufnr()
-- vim.g -> a table to access global variables
-- vim.opt -> to set options

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Special personalized features
require("specialfeat")

-- [[General options]]
-- See `:help vim.o`
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 99
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.mouse = 'a'

-- be fast
vim.opt.ttyfast = true
vim.opt.synmaxcol = 256
vim.opt.lazyredraw = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.breakindent = true
vim.o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Window options --
vim.wo.number = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

vim.g.xml_syntax_folding = 1

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Insert spaces
vim.api.nvim_set_keymap('n', '-', 'a<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '_', 'i<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '=', 'o<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '+', 'O<Esc>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>hn', ':noh<CR>', {noremap = true})

-- move splits
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>-', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>+', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>>', {noremap = true})

--select line without newline
vim.api.nvim_set_keymap('n', '<leader>v', '0v$h', {noremap = true})

-- copy	(global reg)
vim.api.nvim_set_keymap('n', '<C-c>', 'ma0v$h"+y`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})
-- cut	(global reg)
vim.api.nvim_set_keymap('n', '<C-x>', 'ma0v$h"+x`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-x>', '"+x', {noremap = true})
-- paste (global reg)
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-V>', '"+P', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-V>', '"+P', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-V>', '<Esc>"+Pa', {noremap = true})

-- copy word (reg c)
vim.api.nvim_set_keymap('n', '<leader>y', 'ma"cyiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"cy', {noremap = true})
-- cut word (reg c)
vim.api.nvim_set_keymap('n', '<leader>x', 'ma"cdiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>x', '"cd', {noremap = true})
-- paste (reg c)
vim.api.nvim_set_keymap('n', '<leader>p', '"cp', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"cP', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"cp', {noremap = true})
-- replace word	(reg c)
vim.api.nvim_set_keymap('n', '<leader>r', 'diw"cp', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>R', 'diw"cP', {noremap = true})

-- delete word and write
vim.api.nvim_set_keymap('n', '<leader>c', 'lbvec', {noremap = true})

-- function keys
vim.api.nvim_set_keymap('n', '<F2>', ':set relativenumber!<CR>:set relativenumber?<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':set list!<CR>:set list?<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', ':lua toggle_background()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F5>', ':lua toggle_virtualedit()<CR>', {noremap = true})

-- wrap visual
vim.api.nvim_set_keymap('v', "'", "<ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll", {noremap = true})

-- diff
vim.api.nvim_set_keymap('n', '<C-f><C-f>', ':w !diff --color % -<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>d', ':lua catselection("~/.util/ds/diff1.txt")<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>f', ':lua catandshowdiff()<CR>', {noremap = true})

-- saving file
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-S>', '<ESC>:w<CR>a', {noremap = true})

-- Terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- Deactivate because of nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1


-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("myplugs")
-- Setup plugins
require("setupmyplugs")

vim.api.nvim_set_keymap('n', '<C-b>d', ':Bdelete<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'tt', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'ta', ':AerialToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'ts', ':SymbolsOutline<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'te', ':ToggleTerm<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'st', ':ToggleTermSendCurrentLine<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', 'st', ':ToggleTermSendVisualLines<CR>', {noremap = true})

-- Fold code structures
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.fen = true
