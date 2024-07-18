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


vim.keymap.set('n', "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo: Telescope" })
vim.keymap.set('n', "<leader>td", "<cmd>TodoTrouble<CR>", { desc = "Todo: Trouble" })

local dap = require('dap')
local gdap = require('dap-go')

-- vim.keymap.set('n', "<leader>db", function() dap.toggle_breakpoint() end, { desc = "[D]ebug [B]reakpoint" })
vim.keymap.set('n', "<leader>dc", function() dap.continue() end, { desc = "[D]ebug [C]ontinue" })
vim.keymap.set('n', "<leader>dn", function() dap.step_over() end, { desc = "[D]ebug [N]ext" })
vim.keymap.set('n', "<leader>ds", function() dap.step_into() end, { desc = "[D]ebug [S]tep" })
vim.keymap.set('n', "<leader>dr", function() dap.repl.open() end, { desc = "[D]ebug [R]epl" })

vim.keymap.set('n', "<leader>dt", function() gdap.debug_test() end, { desc = "[D]ebug [T]est" })
-- vim.keymap.set('n', "<leader>da", function() gdap.debug_last_test() end, { desc = "[D]ebug Test [A]gain" })


-- Todo-Comments
vim.keymap.set('n', "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo: Telescope" })
vim.keymap.set('n', "<leader>td", "<cmd>TodoTrouble<CR>", { desc = "Todo: Trouble" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>`", [[<cmd>lua require("persistence").load()<cr>]], {})
