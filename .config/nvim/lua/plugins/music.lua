return {
	'p5quared/apple-music.nvim',
	dev = true,
	dir = '~/Code/apple-music.nvim',
	dependencies = { "ibhagwan/fzf-lua" },
	opts = {
		picker = "fzf-lua",
	},
	keys = {
		{ "<leader>mp", function() require("apple-music").toggle_play() end,     desc = "Apple Music: Toggle Playback" },
		{ "<leader>ms", function() require("apple-music").toggle_shuffle() end,  desc = "Apple Music: Toggle Shuffle" },
		{ "<leader>fp", function() require("apple-music").select_playlist() end, desc = "Apple Music: Select Playlist with Telescope" },
		{ "<leader>fa", function() require("apple-music").select_album() end,    desc = "Apple Music: Select Album with Telescope" },
		{ "<leader>fs", function() require("apple-music").select_track() end,    desc = "Apple Music: Select Track with Telescope" },
		{ "<leader>mc", function() require("apple-music").cleanup() end,         desc = "Apple Music: Cleanup Temporary Playlists" },
		{ "<leader>mx", function() require("apple-music").cleanup_all() end,     desc = "Apple Music: Cleanup Temporary Playlists" },
	}
}
