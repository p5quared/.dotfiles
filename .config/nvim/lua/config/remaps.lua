vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copilot yuk
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


-- Space creation
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w>j")

-- Space mobility
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Space resized
vim.keymap.set("n", "<C-up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-right>", ":vertical resize -2<CR>")

-- Telescope
local tb = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tb.find_files)
vim.keymap.set('n', '<leader>ft', tb.git_files)
vim.keymap.set('n', '<leader>fg', tb.live_grep)
vim.keymap.set('n', '<leader>fb', tb.buffers)
vim.keymap.set('n', '<leader>fc', tb.colorscheme)
vim.keymap.set('n', '<leader>fk', tb.keymaps)

local ref = require('refactoring')
vim.keymap.set("x", "<leader>re", function() ref.refactor('Extract Function') end)
vim.keymap.set("x", "<leader>rf", function() ref.refactor('Extract Function To File') end)

vim.keymap.set("x", "<leader>rv", function() ref.refactor('Extract Variable') end)

vim.keymap.set("n", "<leader>rI", function() ref.refactor('Inline Function') end)

vim.keymap.set({ "n", "x" }, "<leader>ri", function() ref.refactor('Inline Variable') end)
