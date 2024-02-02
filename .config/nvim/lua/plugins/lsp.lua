return {
	'VonHeikemen/lsp-zero.nvim',
	lazy = true,
	branch = 'v2.x',
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
		--		{ 'onsails/lspkind.nvim' },
	},
	init = function()
		local lsp = require('lsp-zero')

		lsp.preset("recommended")

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr })

			vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { buffer = bufnr })
			vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, { buffer = bufnr })
			vim.keymap.set("n", "<leader>da", function() vim.lsp.buf.code_action() end, opts)
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
				['gopls'] = { 'go' },
				--				['ocamllsp'] = { 'ocaml' },
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
		cmp.setup({
			mapping = {
				['<CR>'] = cmp.mapping.confirm({
					-- documentation says this is important.
					-- I don't know why.
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				})
			},
			formatting = {
				expandable_indicator = false,
				fields = { 'abbr', 'kind', 'menu' },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = 'λ',
						luasnip = '⋗',
						buffer = 'Ω',
						path = '🖫',
						nvim_lua = 'Π',
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
	end,
}
