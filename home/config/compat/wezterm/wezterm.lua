local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

config.window_decorations = "NONE"

config.color_scheme = 'nord'

config.window_background_opacity = 0.9

return config
