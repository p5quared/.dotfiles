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
		'nvim-pack/nvim-spectre',
		keys = {
			{ '<leader>S',  '<cmd>lua require("spectre").toggle()<CR>',                             desc = "[S]pectre" },
			{ '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',      desc = "[S]pectre [W]ord" },
			{ '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>',                   desc = "[S]pectre [W]ord (visual)" },
			{ '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "[S]pectre [P]roject (file)" },
		}
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
		enabled = true,
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestions = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
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
	{
		'L3MON4D3/LuaSnip',
		dependencies = { "rafamadriz/friendly-snippets" },
		init = function()
			require('luasnip').config.setup()
			require('luasnip/loaders/from_vscode').lazy_load()
		end
	},
}
