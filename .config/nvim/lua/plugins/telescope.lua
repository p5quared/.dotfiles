return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>ff', function() require('telescope.builtin').find_files() end, desc = "[F]ind [F]ile" },
		{ '<leader>ft', function() require('telescope.builtin').git_files() end, desc = "[F]ind [T]ree" },
		{ '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = "[F]ind [G]rep" },
		{ '<leader>fc', function() require('telescope.builtin').colorscheme() end, desc = "[F]ind [C]olorscheme" },
		{ '<leader>fk', function() require('telescope.builtin').keymaps() end, desc = "[F]ind [K]eymaps" },
	},
}
