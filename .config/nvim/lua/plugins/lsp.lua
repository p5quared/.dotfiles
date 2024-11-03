return {
	'VonHeikemen/lsp-zero.nvim',
	lazy = true,
	branch = 'v3.x',
	dependencies = {
		-- LSP Support
		{ 'folke/lazydev.nvim' },
		{ 'neovim/nvim-lspconfig' }, -- Required
		{                          -- Optional
			'williamboman/mason.nvim',
			lazy = false,
			init = function()
				---@diagnostic disable-next-line: param-type-mismatch
				pcall(vim.cmd, 'MasonUpdate')
			end,
			config = true,
		},
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

		-- Autocompletion
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				{
					"zbirenbaum/copilot-cmp",
					opts = {},
				},
			}
		},                        -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{
			'L3MON4D3/LuaSnip',
			lazy = true,
		}, -- Required
		{ 'hrsh7th/cmp-cmdline' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'onsails/lspkind.nvim' },
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	init = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false,
			})

			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = bufnr })
			vim.keymap.set("n", "<leader>da", function() vim.lsp.buf.code_action() end, opts)
		end)


		lsp_zero.format_on_save({
			format_opts = {
				async = true,
				timeout_ms = 10000
			},
			servers = {
				['lua_ls'] = { 'lua' },
				['tsserver'] = { 'javascript', 'typescript' },
				['svelte-language-server'] = { 'svelte' },
				['gopls'] = { 'go' },
				['asmfmt'] = { 'asm', 's' }, -- don't work
				['ocamlformat'] = { 'ocaml' },
				['terraformls'] = { 'terraform' }
			}
		})

		lsp_zero.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»'
		})

		require('mason-lspconfig').setup({
			handlers = {
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require('lspconfig').lua_ls.setup(lua_opts)
				end,
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,
			}
		})

		local cmp = require('cmp')
		local lspkind = require('lspkind')
		lspkind.init({
			symbol_map = { Copilot = "" }
		})

		local cmp_action = lsp_zero.cmp_action()
		cmp.setup({

			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'copilot' },
				{ name = 'path' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
			}),

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = {
				['<Enter>'] = cmp.mapping.confirm({
					-- documentation says this is important.
					-- I don't know why.
					behavior = cmp.ConfirmBehavior.Replace,
					-- TODO: Evaluate whether we really should
					-- be selecting automatically
					select = true,
				}),
				['<C-n>'] = cmp_action.luasnip_jump_forward(),
				['<C-p>'] = cmp_action.luasnip_jump_backward(),
				['<C-u>'] = cmp.mapping.scroll_docs(4),
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<Tab>'] = cmp_action.luasnip_supertab(),
				['<S-Tab>'] = cmp_action.luasnip_shift_supertab()
			},
			formatting = {
				expandable_indicator = true,
				fields = { 'abbr', 'kind', 'menu' },
				format = lspkind.cmp_format({
					mode = 'symbol_text',
					ellipses_char = '…',
					show_labelDetails = true,
				})
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
			})
		})
	end,
}
