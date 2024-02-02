-- TODO: Configure to lazy-load wherever possible.

return {
	{
		"folke/neodev.nvim",
		config = {}
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	"github/copilot.vim",
	'lervag/vimtex',
	{
		'ggandor/leap.nvim',
		dependencies = {
			'tpope/vim-repeat'
		},
		init = function()
			require('leap').create_default_mappings()
		end,

	}
}
