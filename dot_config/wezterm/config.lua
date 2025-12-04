local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	-- enable_wayland = true,
	audible_bell = "Disabled",
	default_cursor_style = "SteadyBlock",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	font_size = 20,
	line_height = 1.1,
	font = wezterm.font("Agave Nerd Font Mono"),
	enable_tab_bar = false,
	window_padding = {
		left = 1.5,
		right = 1.5,
		top = 1.5,
		bottom = 1,
	},
	-- from: https://akos.ma/blog/adopting-wezterm/
	hyperlink_rules = {
		-- Matches: a URL in parens: (URL)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in brackets: [URL]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in curly braces: {URL}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in angle brackets: <URL>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		-- Then handle URLs not wrapped in brackets
		{
			-- Before
			--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
			--format = '$0',
			-- After
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",
			highlight = 1,
		},
		-- implicit mailto link
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
	},
}

config.keys = {
	-- disable default actions for zoom in and out
	{ key = "-", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
}

return config
