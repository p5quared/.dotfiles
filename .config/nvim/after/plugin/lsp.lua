require("neodev").setup({})

local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})

	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', {buffer = bufnr})
end)

lsp.setup()


local cmp = require('cmp')
cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({
			-- documentation says this is important.
			-- I don't know why.
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		})
	}
})
