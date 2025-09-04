local wezterm = require("wezterm")

return {
	color_scheme = "Dark+",
	use_ime = true,
	font_size = 13.7 -- screen res 1080p
	font = wezterm.font("UDEV Gothic 35NF"),
	warn_about_missing_glyphs = false,
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	enable_wayland = false,
}
