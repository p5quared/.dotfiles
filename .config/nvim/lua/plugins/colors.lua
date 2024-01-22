return {
	'rose-pine/neovim',
	"loctvl842/monokai-pro.nvim",
	"ellisonleao/gruvbox.nvim",
	'arcticicestudio/nord-vim',
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rebelot/kanagawa.nvim",
	'ramojus/mellifluous.nvim',
	"EdenEast/nightfox.nvim",

	{"mcchrish/zenbones.nvim",
	dependencies = {
		"rktjmp/lush.nvim"
	}
},

	-- Not a colorscheme
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			'css',
			'javascript',
			html = {
				mode = 'foreground',
			}
		}
	}

}
