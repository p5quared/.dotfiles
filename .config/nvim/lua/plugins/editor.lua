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
			vim.keymap.set('n', 's', '<Plug>(leap)')
			vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
			vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
			vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')
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
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{ -- TODO: Consider dropping this
		'echasnovski/mini.pairs',
		version = false,
		config = true,
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
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestions = { enabled = false },
			panel = { enabled = false },
		},
	},
	{          -- TODO: Probably remove
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
