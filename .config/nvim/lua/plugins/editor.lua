-- INFO: Perform actions that pertain to modifying or navigating files.

return {
	{
		'stevearc/oil.nvim',
		opts = {
			float = {
				padding = 4,
			},
			view_options = {
				show_hidden = true,
			}
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
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
	{
		'nvim-pack/nvim-spectre'
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'echasnovski/mini.pairs',
		version = false,
		config = true,
	},
	{
		"zbirenbaum/copilot.lua",
		enabled = true,
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestions = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		init = function()
			local harpoon = require("harpoon")

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
		end
	},
	{
		'L3MON4D3/LuaSnip',
		dependencies = { "rafamadriz/friendly-snippets" },
		init = function()
			require('luasnip').config.setup()
			require('luasnip/loaders/from_vscode').lazy_load()
		end
	},
}
