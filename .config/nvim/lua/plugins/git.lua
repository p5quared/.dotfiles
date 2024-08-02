return {
	{
		'pwntester/octo.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		opts = function(_, opts)
			vim.treesitter.language.register("markdown", "octo")
			opts.picker = "telescope"
		end,
		config = true,
		cmd = "Octo",
		event = { { event = "BufReadCmd", pattern = "octo://*" } },
	},
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" }
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
}
