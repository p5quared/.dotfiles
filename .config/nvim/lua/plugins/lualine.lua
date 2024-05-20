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
			'%=', --[[ add your center compoentnts here in place of this comment ]]
		},
		lualine_x = {},
		lualine_y = { 'branch', 'diff' },
		lualine_z = {
			{ 'datetime', style = "%a %H:%M%p", separator = { right = '' }, left_padding = 2 },
		},
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
	extensions = { 'trouble', 'nvim-dap-ui', 'mason', 'oil' },
}

return {
	'nvim-lualine/lualine.nvim',
	opts = config,
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}
