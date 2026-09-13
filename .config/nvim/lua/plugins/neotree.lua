local function context_path()
	if vim.bo.filetype == 'neo-tree' then
		local state = require('neo-tree.sources.manager').get_state_for_window()
		local node = state and state.tree and state.tree:get_node()
		return node and node.path or state and state.path or vim.fn.getcwd()
	end
	local path = vim.api.nvim_buf_get_name(0)
	return vim.bo.buftype == '' and path ~= '' and path or vim.fn.getcwd()
end

local function filesystem(reveal)
	local path = context_path()
	require('neo-tree.command').execute({
		source = 'filesystem',
		position = 'left',
		toggle = not reveal,
		dir = require('config.neotree_roots').filesystem_root(path),
		reveal_file = path,
	})
end

local function selected_directory(state)
	local node = state.tree:get_node()
	if not node or not node.path then
		return state.path
	end
	return node.type == 'directory' and node.path or vim.fs.dirname(node.path)
end

return {
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		keys = {
			{ '<leader>nt', function() filesystem(false) end, desc = 'Toggle file tree' },
			{ '<leader>nr', function() filesystem(true) end, desc = 'Reveal current file' },
			{
				'<leader>nb',
				function() require('neo-tree.command').execute({ source = 'buffers', position = 'left' }) end,
				desc = 'Show buffers tree',
			},
			{
				'<leader>ng',
				function()
					local root = require('config.neotree_roots').git_root(context_path())
					if not root then
						vim.notify(
							'No Git repository here. Select a package in the tree and try again.',
							vim.log.levels.INFO
						)
						return
					end
					require('neo-tree.command').execute({ source = 'git_status', position = 'left', dir = root })
				end,
				desc = 'Show package Git changes',
			},
		},
		opts = {
			source_selector = { winbar = false, statusline = false },
			window = {
				position = 'left',
				width = 35,
			},
			filesystem = {
				bind_to_cwd = false,
				group_empty_dirs = true,
				hijack_netrw_behavior = 'disabled',
				use_libuv_file_watcher = true,
				follow_current_file = { enabled = true },
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = { '.git', '__pycache__', '.DS_Store' },
				},
				commands = {
					copy_relative_path = function(state)
						local node = state.tree:get_node()
						if node and node.path then
							local path = vim.fs.relpath(state.path, node.path)
							vim.fn.setreg('+', path)
							vim.notify('Copied: ' .. path)
						end
					end,
					find_files = function(state)
						require('telescope.builtin').find_files({ cwd = selected_directory(state) })
					end,
					live_grep = function(state)
						require('telescope.builtin').live_grep({ cwd = selected_directory(state) })
					end,
				},
				window = {
					mappings = {
						['Y'] = 'copy_relative_path',
						['<leader>ff'] = 'find_files',
						['<leader>fg'] = 'live_grep',
					},
				},
			},
			buffers = { bind_to_cwd = false },
		},
	},
	{
		'Crysthamus/nvim-file-operations',
		dependencies = { 'nvim-neo-tree/neo-tree.nvim' },
		opts = { auto_save = false },
	},
}
