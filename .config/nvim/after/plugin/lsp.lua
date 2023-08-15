local lsp = require('lsp-zero')

lsp.preset("recommended")
lsp.setup()
lsp.clangd.setup({
	cmd = {
		"clangd",
		"--offset-encoding=utf-16"
	}
})

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


print('LSP Setup')
