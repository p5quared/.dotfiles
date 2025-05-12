return {
	"oonamo/ef-themes.nvim",
	"folke/tokyonight.nvim",
	"RRethy/base16-nvim",
	"catppuccin/nvim",
	"yorik1984/newpaper.nvim",
	'Mofiqul/vscode.nvim',
	"vague2k/vague.nvim",
	"yorickpeterse/vim-paper",
	"ashen-org/ashen.nvim",
	{ 'datsfilipe/vesper.nvim' },
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
