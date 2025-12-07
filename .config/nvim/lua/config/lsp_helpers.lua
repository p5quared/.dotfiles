local M = {}

function M.setup_keymaps(bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
end

function M.setup_format_on_save(bufnr, client)
	local format_filetypes = {
		lua = true,
		javascript = true,
		typescript = true,
		svelte = true,
		go = true,
		ocaml = true,
		terraform = true,
		rust = true,
	}

	local filetype = vim.bo[bufnr].filetype
	if format_filetypes[filetype] and client.supports_method('textDocument/formatting') then
		local augroup = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = false })
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					async = false,
					timeout_ms = 10000,
					bufnr = bufnr,
				})
			end,
		})
	end
end

return M
