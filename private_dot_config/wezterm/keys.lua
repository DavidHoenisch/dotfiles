local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.keys = {
	{ key = "+", mods = "CTRL", action = wezterm.action.DisableDefaultAssigment },
	{ key = "-", mods = "CTRL", action = wezterm.action.DisableDefaultAssigment },
}

return config
