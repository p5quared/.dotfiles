-- TODO: Configure to lazy-load wherever possible.
-- NOTE: The `keys` field AUTOMATICALLY sets the plugin to lazy-load. (on keypress)
return {
	{
		"folke/neodev.nvim",
		config = true,
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
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<CR>",                          desc = "Trouble: Toggle" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>",    desc = "Trouble: Workspace Diagnostics" },
			{ "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>", desc = "Trouble: Document Diagnostics" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>",                  desc = "Trouble: Location List" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>",                 desc = "Trouble: Quickfix" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
		config = true,
		keys = {
			{ "<leader>tt", "<cmd>TodoTelescope<CR>", desc = "Todo: Telescope" },
			{ "<leader>td", "<cmd>TodoTrouble<CR>",   desc = "Todo: Trouble" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown: Preview" },
		},
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
		--			keys = {
		--				{ '<leader>gb', function() require('gitsigns').toggle_current_line_blame end, desc = "Toggle Blame" }
		--			},
		config = true,
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
				desc = "[R]efactor: [E]xtract to Function",
				mode = "x",
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
		config = true,
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},
}
