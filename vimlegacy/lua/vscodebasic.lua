-- vim.cmd -> to execute Vim commands e.g. cmd('pwd')
-- vim.fn -> to call Vim functions e.g. fn.bufnr()
-- vim.g -> a table to access global variables
-- vim.opt -> to set options


vim.g.mapleader = "-"
vim.g.maplocalleader = "\\"

--sourcing some legacy vim files
vim.cmd('source ~/configfiles/legcode.vim')

------------- mappings -------------
vim.api.nvim_set_keymap('n', '<Space>', 'a<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '=', 'o<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '+', 'O<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>hn', ':noh<CR>', {noremap = true})
--visual block
vim.api.nvim_set_keymap('v', '<C-q>', '<C-v>', {noremap = true})

-- copy to global register
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})

--de-highlight
vim.api.nvim_set_keymap('n', '<leader>hn', ':noh<CR>', {noremap = true})
--select line without newline
vim.api.nvim_set_keymap('n', '<leader>v', '0v$h', {noremap = true})

--copy word		(reg c)
vim.api.nvim_set_keymap('n', '<leader>y', 'ma"cyiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"cy', {noremap = true})
--cut word		(reg c)
vim.api.nvim_set_keymap('n', '<leader>x', 'ma"cxiw`a', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>x', '"cx', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>D', '"cD', {noremap = true})
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

--wrap visual
vim.api.nvim_set_keymap('v', "'", "<ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll", {noremap = true})

-- vscode stuff
vim.api.nvim_set_keymap('n', '<C-k><C-i>', ':call VSCodeNotify("editor.action.showHover")<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-b>', ':call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>', {noremap = true})


-- diff
vim.api.nvim_set_keymap('v', '<leader>d', ':lua catselection("~/.util/ds/diff1.txt")<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>f', ':lua catandshowdiff()<CR>', {noremap = true})

-- functions
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
