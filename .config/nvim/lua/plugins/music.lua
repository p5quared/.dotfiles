return {
	'p5quared/apple-music.nvim',
	dev = true,
	dir = '~/Code/apple-music.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	config = true,
	keys = {
		{ "<leader>amp", function() require("apple-music").toggle_play() end,               desc = "Apple Music: Toggle Playback" },
		{ "<leader>ams", function() require("apple-music").toggle_shuffle() end,            desc = "Apple Music: Toggle Shuffle" },
		{ "<leader>fp",  function() require("apple-music").select_playlist_telescope() end, desc = "Apple Music: Select Playlist with Telescope" },
		{ "<leader>fa",  function() require("apple-music").select_album_telescope() end,    desc = "Apple Music: Select Album with Telescope" },
		{ "<leader>fs",  function() require("apple-music").select_track_telescope() end,    desc = "Apple Music: Select Track with Telescope" },
		{ "<leader>amc", function() require("apple-music").cleanup() end,                   desc = "Apple Music: Cleanup Temporary Playlists" },
		{ "<leader>amx", function() require("apple-music").cleanup_all() end,               desc = "Apple Music: Cleanup Temporary Playlists" },
	}
}
