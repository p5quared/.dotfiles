return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' }, -- Required
		{                       -- Optional
			'williamboman/mason.nvim',
			init = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' }, -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{ 'L3MON4D3/LuaSnip' }, -- Required
	},
	init = function()
		local lsp = require('lsp-zero')

		lsp.preset("recommended")

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })

			vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { buffer = bufnr })
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = bufnr })
			vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)
		end)

		lsp.format_on_save({
			format_opts = {
				async = true,
				timeout_ms = 10000
			},
			servers = {
				['lua_ls'] = { 'lua' },
				['tsserver'] = { 'javascript', 'typescript' },
				['svelte-language-server'] = { 'svelte' },
				['gopls'] = { 'go' }
			}
		})

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
	end,
}  -- END LSP-ZERO --
