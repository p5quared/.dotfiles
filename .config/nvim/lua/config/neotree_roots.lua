local M = {}

function M.git_root(path) return vim.fs.root(path or vim.fn.getcwd(), '.git') end

function M.filesystem_root(path)
	-- In the work config, return the Brazil workspace root here.
	return M.git_root(path) or vim.fn.getcwd()
end

return M
