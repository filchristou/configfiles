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

--wrap visual
vim.api.nvim_set_keymap('v', "'", "<ESC><ESC>`>a'<ESC>`<i'<ESC>`>ll", {noremap = true})
