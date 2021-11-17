-- vim.cmd -> to execute Vim commands e.g. cmd('pwd')
-- vim.fn -> to call Vim functions e.g. fn.bufnr()
-- vim.g -> a table to access global variables
-- vim.opt -> to set options


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
vim.api.nvim_set_keymap('n', '<Space>', 'a<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '=', 'o<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '+', 'O<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>hn', ':noh<CR>', {noremap = true})
-- scroll left or right
vim.api.nvim_set_keymap('n', ']', 'zlzlzl', {noremap = true})
vim.api.nvim_set_keymap('n', ']', 'zhzhzh', {noremap = true})
--move splits
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>-', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>+', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>>', {noremap = true})

--copy	(reg x)
vim.api.nvim_set_keymap('n', '<C-c>', 'ma0v$h"+y`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})
--cut	(reg x)
vim.api.nvim_set_keymap('n', '<C-x>', 'ma0v$h"+x`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-x>', '"+x', {noremap = true})
--paste (reg x)
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-V>', '"+P', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-V>', '"+P', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-V>', '<Esc>"+Pa', {noremap = true})
--select line without newline
vim.api.nvim_set_keymap('n', '<leader>v', '0v$h', {noremap = true})
--copy word		(reg c)
vim.api.nvim_set_keymap('n', '<leader>y', 'ma"cyiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"cy', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"cY', {noremap = true})
--cut word		(reg c)
vim.api.nvim_set_keymap('n', '<leader>x', 'ma"cxiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>x', '"cx', {noremap = true})
--paste (reg c)
vim.api.nvim_set_keymap('n', '<leader>p', '"cp', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"cP', {noremap = true})
--replace word	(reg c)
vim.api.nvim_set_keymap('n', '<leader>r', 'diw"cp', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>R', 'diw"cP', {noremap = true})
--delete word and write
vim.api.nvim_set_keymap('n', '<leader>c', 'lbvec', {noremap = true})

--empty line
vim.api.nvim_set_keymap('n', '<leader>d', '0D', {noremap = true})

--function keys
vim.api.nvim_set_keymap('n', '<F2>', ':set relativenumber!<CR>:set relativenumber?<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':set list!<CR>:set list?<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', ':lua toggle_background()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F5>', ':lua toggle_virtualedit()<CR>', {noremap = true})

--wrap visual
vim.api.nvim_set_keymap('v', "'", "<ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll", {noremap = true})

--diff
vim.api.nvim_set_keymap('n', '<C-f><C-f>', ':w !diff --color % -<CR>', {noremap = true})
--searching
vim.api.nvim_set_keymap('v', '*', '"vyma:%s/<C-R>v//gn<CR>`a', {noremap = true})
--saving file
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-S>', '<ESC>:w<CR>a', {noremap = true})

--terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

--functions
function toggle_background()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    elseif vim.o.background == "light" then
        vim.o.background = "dark"
    end
    print("vim.o.background=" .. vim.o.background)
end

function toggle_virtualedit()
    if vim.o.virtualedit == "insert" or vim.o.virtualedit == "block" or vim.o.virtualedit == "onemore" or vim.o.virtualedit == "" then
        vim.o.virtualedit = "all"
    else
        vim.o.virtualedit = "block"
    end
    print("vim.o.virtualedit=" .. vim.o.virtualedit)
end
