-- TODO: Configure to lazy-load wherever possible.

return {
	{
		"folke/neodev.nvim",
		config = {}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			require("which-key").setup({})
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'L3MON4D3/LuaSnip',
		dependencies = { "rafamadriz/friendly-snippets" },
		init = function()
			require('luasnip').config.setup()
			require('luasnip/loaders/from_vscode').lazy_load()
		end
	},
	"github/copilot.vim",
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			--			{ '<leader>gtb', function() require('gitsigns').toggle_current_line_blame() end, desc = "Toggle Blame" }
		},
		config = function()
			require('gitsigns').setup()
		end,
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
	'lervag/vimtex',
	{
		'ggandor/leap.nvim',
		dependencies = {
			'tpope/vim-repeat'
		},
		init = function()
			require('leap').create_default_mappings()
		end,

	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>re",
				function() require('refactoring').refactor('Extract Function') end,
				desc = "[R]efactor: [E]xtract to Function"
			},
			{
				"<leader>rf",
				function()
					require(
						'refactoring').refactor('Extract Function To File')
				end,
				desc = "[R]efactor: Extract to [F]ile",
				mode = "x",
			},
			{
				"<leader>rv",
				function() require('refactoring').refactor('Extract Variable') end,
				desc = "[R]efactor: Extract [V]ariable",
				mode = "x",
			},
			{
				"<leader>rI",
				function() require('refactoring').refactor('Inline Function') end,
				desc = "[R]efactor: [I]nline Function"
			},
			{
				"<leader>ri",
				function() require('refactoring').refactor('Inline Variable') end,
				desc = "[R]efactor: [I]nline Variable",
				mode = { "n", "x" },
			},
		},
		config = function()
			require("refactoring").setup()
		end,
	}
}
