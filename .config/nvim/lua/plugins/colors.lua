return {
	"oonamo/ef-themes.nvim",
	"folke/tokyonight.nvim",
	"RRethy/base16-nvim",
	"catppuccin/nvim",
	"gbprod/nord.nvim",
	"yorik1984/newpaper.nvim",
	'Mofiqul/vscode.nvim',
	"vague2k/vague.nvim",
	"yorickpeterse/vim-paper",
	"p00f/alabaster.nvim",
	"ashen-org/ashen.nvim",
	{ 'datsfilipe/vesper.nvim' },
	{
		'jesseleite/nvim-noirbuddy',
		dependencies = {
			{ 'tjdevries/colorbuddy.nvim' }
		},
		lazy = false,
		priority = 1000,
		opts = {
			preset = "slate"
		},
		-- install = { colorscheme = { "noirbuddy" } }
	},
	{
		'ramojus/mellifluous.nvim',
		-- opts = {
		-- 	styles = {
		-- 		comments = { italic = true },
		-- 		-- main_keywords = { bold = true },
		-- 		-- other_keywords = { bold = true },
		-- 	},
		-- }
	},
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
