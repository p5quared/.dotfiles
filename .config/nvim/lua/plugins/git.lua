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

			-- Keep some empty windows in sessions
			vim.api.nvim_create_autocmd("ExitPre", {
				group = vim.api.nvim_create_augroup("octo_exit_pre", { clear = true }),
				callback = function(ev)
					local keep = { "octo" }
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.tbl_contains(keep, vim.bo[buf].filetype) then
							vim.bo[buf].buftype = "" -- set buftype to empty to keep the window
						end
					end
				end,
			})
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
