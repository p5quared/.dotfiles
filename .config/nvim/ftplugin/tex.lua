print("inside latex")

vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { desc = "Compile Latex" })
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>VimtexCompileSS<CR>", { desc = "Compile Latex" })
