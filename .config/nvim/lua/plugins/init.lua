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
	{ 'wakatime/vim-wakatime', lazy = false },
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"leoluz/nvim-dap-go",
			"Weissle/persistent-breakpoints.nvim",
		},
		config = function()
			local dap = require("dap")

			-- Setup the go debug adapter
			require("dap-go").setup()

			-- Setup DAP virtual text
			require("nvim-dap-virtual-text").setup({})
			vim.g.dap_virtual_text = true

			-- Allows breakpoints to last between sessions
			require("persistent-breakpoints").setup({
				load_breakpoints_event = { "BufReadPost" },
			})

			-- Setup DAP UI
			local dapui = require("dapui")
			dapui.setup()

			-- Automatically open the DAP UI when the debugging session begins
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Adding symbols for breakpoints and such
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

			-- Keymaps for debugging
			vim.keymap.set("n", "<leader>db", require("persistent-breakpoints.api").toggle_breakpoint)
			vim.keymap.set("n", "<leader>du", dapui.toggle)
		end,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = true,
		keys = {
			{ "<leader>rr", "<cmd>Rest run<cr>",      desc = "Rest: Run under cursor" },
			{ "<leader>rl", "<cmd>Rest run last<cr>", desc = "Rest: Repeat Last Request" },
		},
		opts = { skip_ssl_verification = true },

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
