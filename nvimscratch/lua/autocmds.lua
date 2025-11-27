-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args)
-- 	local bufnr = args.buf
-- 	local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--
-- 	if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
-- 	    vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
--
-- 	    vim.keymap.set(
-- 		'i',
-- 		'<C-F>',
-- 		vim.lsp.inline_completion.get,
-- 		{ desc = 'LSP: accept inline completion', buffer = bufnr }
-- 	    )
-- 	    vim.keymap.set(
-- 		'i',
-- 		'<C-G>',
-- 		vim.lsp.inline_completion.select,
-- 		{ desc = 'LSP: switch inline completion', buffer = bufnr }
-- 	    )
-- 	end
--     end
-- })

