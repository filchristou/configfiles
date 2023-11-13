-- vim.cmd -> to execute Vim commands e.g. cmd('pwd')
-- vim.fn -> to call Vim functions e.g. fn.bufnr()
-- vim.g -> a table to access global variables
-- vim.opt -> to set options

vim.g.mapleader = " "
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
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.g.xml_syntax_folding = 1

--sourcing some legacy vim files
vim.cmd('source ~/configfiles/legcode.vim')

------------- mappings -------------
vim.api.nvim_set_keymap('n', '-', 'a<Space><Esc>', {noremap = true})
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

--copy	(global reg)
vim.api.nvim_set_keymap('n', '<C-c>', 'ma0v$h"+y`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})
--cut	(global reg)
vim.api.nvim_set_keymap('n', '<C-x>', 'ma0v$h"+x`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-x>', '"+x', {noremap = true})
--paste (global reg)
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
--cut word		(reg c)
vim.api.nvim_set_keymap('n', '<leader>x', 'ma"cxiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>x', '"cx', {noremap = true})
--paste (reg c)
vim.api.nvim_set_keymap('n', '<leader>p', '"cp', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"cP', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"cp', {noremap = true})
--replace word	(reg c)
vim.api.nvim_set_keymap('n', '<leader>r', 'diw"cp', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>R', 'diw"cP', {noremap = true})
--delete word and write
vim.api.nvim_set_keymap('n', '<leader>c', 'lbvec', {noremap = true})

--indent code according to previous line
vim.api.nvim_set_keymap('n', '<leader>i', 'I<Esc>v0xi<Bs><CR><Esc>', {noremap = true})

--empty line
vim.api.nvim_set_keymap('n', '<leader>d', '0D', {noremap = true})

-- delete current buffer and return to previous
vim.api.nvim_set_keymap('n', '<c-b><c-d>', ':bprevious<CR>:bdelete #<CR><CR>', {noremap = true})

--function keys
vim.api.nvim_set_keymap('n', '<F2>', ':set relativenumber!<CR>:set relativenumber?<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':set list!<CR>:set list?<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', ':lua toggle_background()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F5>', ':lua toggle_virtualedit()<CR>', {noremap = true})

--wrap visual
vim.api.nvim_set_keymap('v', "'", "<ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll", {noremap = true})

--diff
vim.api.nvim_set_keymap('n', '<C-f><C-f>', ':w !diff --color % -<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>d', ':lua catselection("~/.util/ds/diff1.txt")<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>f', ':lua catandshowdiff()<CR>', {noremap = true})

--comments
vim.api.nvim_set_keymap('n', '<localleader>c', 'ma0i#<ESC>`al', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>C', 'ma0:s/^#//<CR>`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<localleader>c', ':call ICharLines("#")<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<localleader>C', ':call IDecharLines("#")<CR>', {noremap = true})


--searching
--vim.api.nvim_set_keymap('v', '*', '"vyma:%s/<C-R>v//gn<CR>`a', {noremap = true})
--
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

function visual_selection_range()
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
    if csrow < cerow or (csrow == cerow and cscol <= cecol) then
        return csrow, cerow
    else
        return cerow, csrow
    end
end

function catselection(file)
    fr, lr = visual_selection_range()
    filpath = vim.fn.expand('%')
    com = string.format("sed -n %s,%sp %s > %s", fr, lr, filpath, file)
    vim.cmd("!"..com)
end

function catandshowdiff()
    catselection("~/.util/ds/diff2.txt")
    showdiff(0)
end

function showdiff(mode)
    if mode == 1 then
        vim.cmd("split | term git --no-pager diff --no-index /u/home/wima/fchrstou/.util/ds/diff1.txt /u/home/wima/fchrstou/.util/ds/diff2.txt")
    else
        vim.cmd("split | term git --no-pager diff --no-index --word-diff /u/home/wima/fchrstou/.util/ds/diff1.txt /u/home/wima/fchrstou/.util/ds/diff2.txt")
    end
end
