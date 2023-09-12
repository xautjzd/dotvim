local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}


if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Batman'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16.0

config.tab_bar_at_bottom = true

config.keys = {
  {
    key = '|',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'n',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ShowTabNavigator,
  },
}

return config
