local wezterm = require("wezterm")
local config = require("config")
require("events")

local themes = {
	Kanagawa = "Kanagawa Dragon (Gogh)",
}

config.color_scheme = themes.Kanagawa

return config
