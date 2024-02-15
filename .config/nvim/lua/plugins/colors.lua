return {
	'rose-pine/neovim',
	'arcticicestudio/nord-vim',
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rebelot/kanagawa.nvim",
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
			html = {
				mode = 'foreground',
			}
		}
	}
}
