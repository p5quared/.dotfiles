return {
	"shaunsingh/nord.nvim",
	'rose-pine/neovim',
	"edeneast/nightfox.nvim",
	"sainnhe/everforest",
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rebelot/kanagawa.nvim",
	"matsuuu/pinkmare",
	"sam4llis/nvim-tundra",
	"yorik1984/newpaper.nvim",
	{ 'dasupradyumna/midnight.nvim', lazy = false, priority = 1000 },
	-- Lazy
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},

	{
		'ramojus/mellifluous.nvim',
		opts = {
			color_set = 'mellifluous',

			styles = {
				comments = { italic = true },
				keywords = { bold = true },
				types = { italic = true },
			},
		}
	},
	'AlexvZyl/nordic.nvim',
	"nyoom-engineering/oxocarbon.nvim",
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim"
		},
	},

	-- Not a colorscheme
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			'css',
			'javascript',
			'lua',
			'go',
			html = {
				mode = 'foreground',
			}
		}
	}
}
