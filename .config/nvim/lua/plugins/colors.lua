return {
	'rose-pine/neovim',
	"edeneast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rebelot/kanagawa.nvim",
	"yorik1984/newpaper.nvim",
	"fynnfluegge/monet.nvim",
	'liuchengxu/space-vim-theme',
	'liuchengxu/space-vim-dark',
	{
		"dgox16/oldworld.nvim",
		opts = {
			styles = {
				comments = { italic = true }
			}
		}
	},
	{ 'dasupradyumna/midnight.nvim', lazy = false, priority = 1000 },
	{
		'ramojus/mellifluous.nvim',
		opts = {
			color_set = 'mellifluous',

			styles = {
				comments = { italic = true },
				keywords = { bold = true },
			},
		}
	},
	'AlexvZyl/nordic.nvim',
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
