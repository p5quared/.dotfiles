return {
	'rose-pine/neovim',
	"edeneast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rebelot/kanagawa.nvim",
	"yorik1984/newpaper.nvim",
	"fynnfluegge/monet.nvim",
	'Mofiqul/vscode.nvim',
	'liuchengxu/space-vim-theme',
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	'projekt0n/github-nvim-theme',
	'liuchengxu/space-vim-dark',
	{
		"dgox16/oldworld.nvim",
		opts = {
			styles = {
				comments = { italic = true }
			}
		}
	},
	{ 'dasupradyumna/midnight.nvim',  lazy = false,   priority = 1000 },
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
			'typescripts',
			'lua',
			'go',
			'ts',
			html = {
				mode = 'foreground',
			}
		},
		config = true,
	}
}
