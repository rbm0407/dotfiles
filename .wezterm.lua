-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Moonfly (Gogh)'
config.color_scheme = 'Andromeda'

config.font = wezterm.font 'Fira Code'

config.enable_tab_bar = false
config.audible_bell = 'Disabled'

-- and finally, return the configuration to wezterm
return config
