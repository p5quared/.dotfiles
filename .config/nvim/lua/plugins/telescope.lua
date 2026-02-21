return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			path_display = { "filename_first" }
		}
	},
	keys = {
		{ '<leader>ff', function() require('telescope.builtin').find_files() end,  desc = "[F]ind [F]ile" },
		{ '<leader>ft', function() require('telescope.builtin').git_files() end,   desc = "[F]ind [T]ree" },
		{ '<leader>fg', function() require('telescope.builtin').live_grep() end,   desc = "[F]ind [G]rep" },
		{ '<leader>fc', function() require('telescope.builtin').colorscheme() end, desc = "[F]ind [C]olorscheme" },
		{ '<leader>fk', function() require('telescope.builtin').keymaps() end,     desc = "[F]ind [K]eymaps" },
		{
			'<leader>fs',
			function()
				local opts = {}
				if vim.bo.filetype == 'java' then
					opts.filter_fn = function(symbol)
						local uri = symbol.location and symbol.location.uri or ''
						return not uri:match('^jdt://')
					end
				end
				require('telescope.builtin').lsp_dynamic_workspace_symbols(opts)
			end,
			desc = "[F]ind [S]ymbols"
		},
	},
}
