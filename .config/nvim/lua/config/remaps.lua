vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "x" }, "Y", '"*y')

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

-- Space resizing
vim.keymap.set("n", "<C-up>", ":resize +2<CR>", { desc = "Resize +Veritcal" })
vim.keymap.set("n", "<C-down>", ":resize -2<CR>", { desc = "Resize -Vertical" })
vim.keymap.set("n", "<C-left>", ":vertical resize +2<CR>", { desc = "Resize +Horizontal" })
vim.keymap.set("n", "<C-right>", ":vertical resize -2<CR>", { desc = "Resize -Horizontal" })

-- Easier quit terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")


-- gitsigns
local gs = package.loaded.gitsigns
vim.keymap.set("n", "<leader>gb", function() gs.toggle_current_line_blame() end, { desc = "Toggle Inline [G]it [B]lame" })
vim.keymap.set("n", "<leader>ghp", function() gs.preview_hunk_inline() end, { desc = "[G]it [H]unk [P]review (Inline)" })
vim.keymap.set("n", "<leader>ghP", function() gs.preview_hunk() end, { desc = "[G]it [H]unk [P]review" })

-- Telescope
local tb = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tb.find_files, { desc = "[F]ind [F]ile" })
vim.keymap.set('n', '<leader>ft', tb.git_files, { desc = "[F]ind [T]ree" })
vim.keymap.set('n', '<leader>fg', tb.live_grep, { desc = "[F]ind [G]rep" })
vim.keymap.set('v', '<leader>fs', tb.grep_string, { desc = "[F]ind [S]election" })
vim.keymap.set('n', '<leader>fb', tb.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set('n', '<leader>fc', tb.colorscheme, { desc = "[F]ind [C]olorscheme" })
vim.keymap.set('n', '<leader>fk', tb.keymaps, { desc = "[F]ind [K]eymaps" })

local noice = require('noice')
vim.keymap.set("n", "<leader>nd", function() noice.cmd('dismiss') end, { desc = "[N]oice [D]ismiss" })
vim.keymap.set("n", "<leader>nl", function() noice.cmd('last') end, { desc = "[N]oice [L]ast" })
