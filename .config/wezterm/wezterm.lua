local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Theme and font imports would need to be handled differently in wezterm
-- You'll need to configure these directly rather than importing from TOML files

-- Shell configuration (uncomment if needed)
-- config.default_prog = { '~/bin/zsh' }

-- Enable config reloading
config.automatically_reload_config = true

-- Window configuration
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"

-- Remove padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- -- Disable tab bar if you want an even more minimal look
config.enable_tab_bar = false

config.window_background_opacity = 1.0
config.win32_system_backdrop = "Disable" -- equivalent to blur = false
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- Cursor configuration
config.default_cursor_style = 'SteadyBlock' -- equivalent to Block shape with blinking Off
config.cursor_thickness = 0.2
config.cursor_blink_rate = 100

-- Mouse configuration
config.hide_mouse_cursor_when_typing = true

config.font = wezterm.font "MonoLisa"
config.font_size = 18.4
config.font_size = 12.4

config.color_scheme = 'Papercolor Dark (Gogh)'

config.front_end = "WebGpu"


return config
