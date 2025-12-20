local config = {
	options = {
		globalstatus = true,
		theme = 'auto',
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
		lualine_b = { { 'filename', path = 4 }, 'diagnostics' },
		lualine_c = {
			'lsp_status', --[[ add your center compoentnts here in place of this comment ]]
		},
		lualine_x = {},
		lualine_y = { { 'branch', fmt = function(str) return str:sub(1, 40) end }, 'diff' },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
	},
	winbar = {
	},
	extensions = { 'trouble', 'oil' },
}

return {
	'nvim-lualine/lualine.nvim',
	opts = config,
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}
