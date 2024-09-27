local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrainsMono NF', {weight = 'Medium', italic = false})
config.font_size = 9.5
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.cell_width = 0.9

config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.window_close_confirmation = 'NeverPrompt'

config.colors = {
	foreground = "#CBE0F0",
	background = "#151515",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.default_prog = { 'C:/msys64/msys2_shell.cmd', '-defterm', '-here', '-no-start', '-mingw64', '-shell', 'zsh' }

return config
