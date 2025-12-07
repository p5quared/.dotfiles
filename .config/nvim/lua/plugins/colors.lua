return {
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"gbprod/nord.nvim",
	'Mofiqul/vscode.nvim',
	"vague2k/vague.nvim",
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
