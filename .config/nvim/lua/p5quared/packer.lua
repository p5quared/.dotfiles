-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	use '~/Code/nvim-autolab'

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground', {run = ':TSUpdate'})

-- Colors / Themes --
  use({ 'rose-pine/neovim', as = 'rose-pine',
  		config = function ()
			require('rose-pine').setup({
			  disable_background = true,
			  disable_float_background = true
		  })
	  end
  })

  use({ "loctvl842/monokai-pro.nvim", config = function () require('monokai-pro').setup({
	  transparent_background = true,
	  background_clear = {
     "float_win",
    "toggleterm",
    "telescope",
    -- "which-key",
    "renamer",
    "notify",
    -- "nvim-tree",
    -- "neo-tree",
    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },
  }) end })

  use({ "ellisonleao/gruvbox.nvim" })

  use({'arcticicestudio/nord-vim', as = 'nord'}, {run = ':TSUpdate'})
--  use 'shaunsingh/nord.nvim'
--  use 'gbprod/nord.nvim'
  -- storm, night, moon, day
  use { "folke/tokyonight.nvim", as = "tokyonight" }

  -- frappe, latte, mocha
  use { "catppuccin/nvim", as = "catppuccin", config = function () require('catppuccin').setup({
	  flavor = "mocha",
	  transparent_background = true
  }) end }

  -- wave, dragon, lotus
  use { "rebelot/kanagawa.nvim", as = "kanagawa" }

  -- Status Bar --
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true}
  }

  -- LSP Setup --
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
} -- END LSP --

use {
	"ThePrimeagen/refactoring.nvim",
	requires = {
		{"nvim-lua/plenary.nvim"},
		{"nvim-treesitter/nvim-treesitter"}
	}
}

use({ "iamcco/markdown-preview.nvim",
	run = "cd app && npm install",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" } 
	end,
	ft = { "markdown" }, })

use ('lervag/vimtex')

end)
