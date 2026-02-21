vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":wqa<CR>", { desc = "Exit (and save)" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })

-- disabled while we use oil
-- vim.keymap.set("n", "<leader>p", vim.cmd.Ex)


-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "x" }, "Y", '"*y')

-- Space creation
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w>j")

-- Space mobility
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Space resizing
vim.keymap.set("n", "<C-up>", ":resize +2<CR>", { desc = "Resize +Veritcal" })
vim.keymap.set("n", "<C-down>", ":resize -2<CR>", { desc = "Resize -Vertical" })
vim.keymap.set("n", "<C-left>", ":vertical resize +2<CR>", { desc = "Resize +Horizontal" })
vim.keymap.set("n", "<C-right>", ":vertical resize -2<CR>", { desc = "Resize -Horizontal" })

vim.keymap.set("n", "<C-C>", ":nohl<CR>", { desc = "No Highlight" })

-- gitsigns
local gs = package.loaded.gitsigns
vim.keymap.set("n", "<leader>gb", function() gs.toggle_current_line_blame() end, { desc = "Toggle Inline [G]it [B]lame" })
vim.keymap.set("n", "<leader>ghp", function() gs.preview_hunk_inline() end, { desc = "[G]it [H]unk [P]review (Inline)" })
vim.keymap.set("n", "<leader>ghP", function() gs.preview_hunk() end, { desc = "[G]it [H]unk [P]review" })

-- Todo-Comments
-- vim.keymap.set('n', "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo: Telescope" })
-- vim.keymap.set('n', "<leader>td", "<cmd>TodoTrouble<CR>", { desc = "Todo: Trouble" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>`", [[<cmd>lua require("persistence").load()<cr>]], {})

-- Inlay hints toggle
vim.keymap.set("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle [I]nlay [H]ints" })
