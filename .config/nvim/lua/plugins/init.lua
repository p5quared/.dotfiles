return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
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
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
		config = true,
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
	'lervag/vimtex',
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = {
					"",
					"▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
					"▏",
					"▏",
					"▏",
					"▏",
					"▏",
				},
				smart_indent_cap = true,
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		}
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		}
	},
	{
		"NoahTheDuke/vim-just",
		ft = { "just" },
	},
}
