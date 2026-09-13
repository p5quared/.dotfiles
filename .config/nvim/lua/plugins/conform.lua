return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	opts = {
		formatters_by_ft = {
			python = { 'ruff_format', 'ruff_organize_imports' },
		},
		format_on_save = function(bufnr)
			if vim.bo[bufnr].filetype == 'python' then
				return { timeout_ms = 2000, lsp_format = 'never' }
			end
		end,
	},
}
