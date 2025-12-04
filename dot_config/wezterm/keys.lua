local wezterm = require("wezterm")

local act = wezterm.action
local config = wezterm.config_builder()

config.keys = {
	{ key = "+", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
}

config.keys = {

	--paste from the clipboard

	{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },


	{ key = 'C', mods = 'CTRL', action = act.CopyTo('Clipboard') },

}

return config
