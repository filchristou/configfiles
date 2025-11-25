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

-- [[General options]]
-- See `:help vim.o`
vim.opt.showmatch = true
vim.opt.hlsearch = true
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
vim.opt.conceallevel = 0

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
vim.g.sleuth_tex_defaults = 'tabstop=4'


-- remove highligh
vim.keymap.set('n', '<leader>hn', '<cmd>nohlsearch<CR>')

-- config lazy script taken from online
require("config.lazy")
