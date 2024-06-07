return {
	'VonHeikemen/lsp-zero.nvim',
	lazy = true,
	branch = 'v3.x',
	dependencies = {
		-- LSP Support
		{ 'folke/neodev.nvim' },
		{ 'neovim/nvim-lspconfig' }, -- Required
		{                      -- Optional
			'williamboman/mason.nvim',
			lazy = false,
			init = function()
				---@diagnostic disable-next-line: param-type-mismatch
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' }, -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{ 'L3MON4D3/LuaSnip' }, -- Required
		{ 'hrsh7th/cmp-cmdline' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'onsails/lspkind.nvim' },
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	init = function()
		local lsp = require('lsp-zero')

		lsp.preset("recommended")

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })

			vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { buffer = bufnr })
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = bufnr })
			vim.keymap.set("n", "<leader>da", function() vim.lsp.buf.code_action() end, opts)
		end)


		lsp.new_server({
			name = 'mipspls',
			cmd = { 'mipspls' },
			filetypes = { '.s', '.mips', '.asm', 'asm', 's', 'mips' },
			root_dir = function()
				return lsp.dir.find_first({ '.mipsproj', 'mipsproj' })
			end,
		})


		lsp.format_on_save({
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

		lsp.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»'
		})

		lsp.setup()
		local cmp = require('cmp')
		local lspkind = require('lspkind')

		cmp.setup({
			window = {
				--completion = cmp.config.window.bordered(),
				--				documentation = cmp.config.window.bordered()
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = {
				['<CR>'] = cmp.mapping.confirm({
					-- documentation says this is important.
					-- I don't know why.
					behavior = cmp.ConfirmBehavior.Replace,
					-- TODO: Evaluate whether we really should
					-- be selecting automatically
					select = true,
				})
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
			sources = cmp.config.sources({
				{ name = 'luasnip' },
				{ name = 'nvim_lsp' },
			}, {
				{ name = 'buffer' },
			})
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
