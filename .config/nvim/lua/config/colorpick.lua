function ColorMyPencils(color)
	color = color or "vague" -- catppuccin frappe is preferred
	-- color = color or "ef-owl" -- catppuccin frappe is preferred
	-- color = color or "noirbuddy" -- catppuccin frappe is preferred
	-- color = color or "tokyonight" -- catppuccin frappe is preferred

	vim.cmd.colorscheme(color)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- ColorMyPencils()
