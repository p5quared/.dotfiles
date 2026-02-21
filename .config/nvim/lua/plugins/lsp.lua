return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'folke/lazydev.nvim',
				ft = 'lua',
				opts = {
					library = {
						{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
					},
				},
			},
			{
				'hrsh7th/nvim-cmp',
				dependencies = {
					{ 'hrsh7th/cmp-nvim-lsp' },
					{ 'hrsh7th/cmp-buffer' },
					{ 'hrsh7th/cmp-path' },
					{ 'hrsh7th/cmp-cmdline' },
					{
						'zbirenbaum/copilot-cmp',
						opts = {},
					},
				},
			},

			{ 'onsails/lspkind.nvim' },
		},

		config = function()
			local lsp_helpers = require('config.lsp_helpers')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
				callback = function(event)
					local bufnr = event.buf
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					lsp_helpers.setup_keymaps(bufnr)
					lsp_helpers.setup_format_on_save(bufnr, client)
					lsp_helpers.setup_inlay_hints(bufnr, client)
				end,
			})

			vim.lsp.config('rust_analyzer', {
				cmd = { '/opt/homebrew/bin/rust-analyzer' },
				capabilities = capabilities,
			})
			vim.lsp.enable('rust_analyzer')

			vim.lsp.config('pyright', {
				cmd = { '/opt/homebrew/bin/pyright-langserver', '--stdio' },
				capabilities = capabilities,
			})
			vim.lsp.enable('pyright')

			vim.lsp.config('gopls', {
				cmd = { '/opt/homebrew/bin/gopls' },
				capabilities = capabilities,
			})
			vim.lsp.enable('gopls')

			vim.lsp.config('lua_ls', {
				cmd = { '/opt/homebrew/bin/lua-language-server' },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
			vim.lsp.enable('lua_ls')
			local cmp = require('cmp')
			local lspkind = require('lspkind')

			lspkind.init({
				symbol_map = {
					Copilot = '',
				},
			})

			cmp.setup({
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'copilot' },
					{ name = 'path' },
					{ name = 'buffer' },
				}),

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),

					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),

					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { 'i', 's' }),

					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),

				formatting = {
					expandable_indicator = true,
					fields = { 'abbr', 'kind', 'menu' },
					format = lspkind.cmp_format({
						mode = 'symbol_text',
						ellipsis_char = '…',
						show_labelDetails = true,
					}),
				},
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				},
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' },
				}),
			})
		end,
	},
}
