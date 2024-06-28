local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()


config.default_prog = { "bash" }

config.font = wezterm.font 'JetBrains Mono'

config.enable_scroll_bar = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}


config.color_schemes = {
	["mydark"] = wezterm.color.get_builtin_schemes()['Bamboo'],
	["mylight"] = wezterm.color.get_builtin_schemes()['Bamboo Light']
}

config.color_scheme = "mylight"

function toggle_dark_light_mode(window, pane)
  print("got event")
  local overrides = window:get_config_overrides() or {}
  if overrides.color_scheme == "mydark" then
    overrides.color_scheme = "mylight"
  else
    overrides.color_scheme = "mydark"
  end
  window:set_config_overrides(overrides)
end

wezterm.on("toggle-dark-light-mode", toggle_dark_light_mode)

config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = 'Space', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 }

config.scrollback_lines = 10000

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- This will create a new split and run your default program inside it
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Toggle light/dark mode
  {
    key = 'd',
    mods = "LEADER",
    action = act.EmitEvent "toggle-dark-light-mode"
  },
  -- Up a page
  {
    key = "PageUp",
    mods = "SHIFT",
    action = act.ScrollByPage(-1)
  },
  -- Up half a page
  {
    key = "PageUp",
    mods = "CTRL|SHIFT",
    action = act.ScrollByPage(-0.5)
  },
  -- Down a page
  {
    key = "PageDown",
    mods = "SHIFT",
    action = act.ScrollByPage(1)
  },
  -- Down half a page
  {
    key = "PageDown",
    mods = "CTRL|SHIFT",
    action = act.ScrollByPage(0.5)
  },
  -- Go to previous tab
  {
    key = "[",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1)
  },
  -- Go to next tab
  {
    key = "]",
    mods = "LEADER",
    action = act.ActivateTabRelative(1)
  },
  -- Open ShowTabNavigator
  {
    key = "t",
    mods = "LEADER",
    action = act.ShowTabNavigator
  },
  -- Activate resize_table KeyTable
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({name="resize_table", one_shot=false})
  },
  -- Activate move_table KeyTable
  {
    key = "m",
    mods = "LEADER",
    action = act.ActivateKeyTable({name="move_table", one_shot=false})
  },
  -- Activate activate_table KeyTable
  {
    key = "a",
    mods = "LEADER",
    action = act.ActivateKeyTable({name="activate_table", one_shot=false})
  },
  -- Clear scrollbar
  {
    key = "c",
    mods = "LEADER",
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  -- CMD-y starts `top` in a new window
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.SpawnCommandInNewWindow {
      args = { 'wezterm' },
    },
  },
}

for i = 1, 9 do
	table.insert(config.keys, {
    key = tostring(i),
    mods= "LEADER",
    action = act.ActivateTab(i-1)
  })
end

config.key_tables = {
  resize_table = {
    {key = "h", action = act.AdjustPaneSize({"Left", 1}) },
    {key = "j", action = act.AdjustPaneSize({"Down", 1}) },
    {key = "k", action = act.AdjustPaneSize({"Up", 1}) },
    {key = "l", action = act.AdjustPaneSize({"Right", 1}) },
    {key = "Escape", action = "PopKeyTable" },
    {key = "Enter", action = "PopKeyTable" },
  },
  move_table = {
    {key = "h", action = act.MoveTabRelative(-1) },
    {key = "j", action = act.MoveTabRelative(-1) },
    {key = "k", action = act.MoveTabRelative(1) },
    {key = "l", action = act.MoveTabRelative(1) },
    {key = "Escape", action = "PopKeyTable" },
    {key = "Enter", action = "PopKeyTable" },
  },
  activate_table = {
    {key = "h", action = act.ActivateTabRelative(-1) },
    {key = "j", action = act.ActivateTabRelative(-1) },
    {key = "k", action = act.ActivateTabRelative(1) },
    {key = "l", action = act.ActivateTabRelative(1) },
    {key = "Escape", action = "PopKeyTable" },
    {key = "Enter", action = "PopKeyTable" },
  },
}


-- scrolling percentage
-- config.default_prog = {'zsh'}

return config
