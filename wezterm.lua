local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()


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

wezterm.on("toggle-dark-light-mode", function (window, pane)
  print("got event")
  local overrides = window:get_config_overrides() or {}
  if overrides.color_scheme == "mydark" then
    overrides.color_scheme = "mylight"
  else
    overrides.color_scheme = "mydark"
  end
  window:set_config_overrides(overrides)
end
)

config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = 'Space', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 }

config.scrollback_lines = 100000

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
    action = act.ScrollByPage(-1)
  },
  -- Up half a page
  {
    key = "PageUp",
    mods = "SHIFT",
    action = act.ScrollByPage(-0.5)
  },
  -- Down a page
  {
    key = "PageDown",
    action = act.ScrollByPage(1)
  },
  -- Down half a page
  {
    key = "PageDown",
    mods = "SHIFT",
    action = act.ScrollByPage(0.5)
  },
  --Upj one line
  { key = 'PageUp', 
    mods = 'CTRL|SHIFT', 
    action = act.ScrollByLine(-1) 
  },
  -- Down one line
  { key = 'PageDown', 
    mods = 'CTRL|SHIFT', 
    action = act.ScrollByLine(1) 
  },
  -- Clear scrollbar
  {
    key = "c",
    mods = "LEADER",
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  -- Activate one tab down
  {
    key = "n",
    mods = "CTRL|SHIFT",
    action = act.ActivateTabRelative(1)
  },
  -- Activate one tab up
  {
    key = "p",
    mods = "CTRL|SHIFT",
    action = act.ActivateTabRelative(-1)
  },
  { key = 'P', 
    mods = 'LEADER', 
    action = act.MoveTabRelative(-1) 
  },
  { key = 'N', 
    mods = 'LEADER', 
    action = act.MoveTabRelative(1) },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({"Left", 1})
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({"Right", 1})
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({"Up", 1})
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({"Down", 1})
  },
  -- Open ShowTabNavigator
  {
    key = "t",
    mods = "LEADER",
    action = act.ShowTabNavigator
  },
  -- CTRL-SHIFT-l activates the debug overlay
  { key = 'D', 
    mods = 'CTRL|SHIFT', 
    action = wezterm.action.ShowDebugOverlay 
  },
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.SpawnCommandInNewWindow ,
  },
  -- Activate resize_table KeyTable
  {
    key = "r",
    mods = "CTRL|SHIFT",
    action = act.ActivateKeyTable({name="resize_table", one_shot=false})
  },
  -- rename tab interactively
  {
    key = 'r',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
	if line then
	  window:active_tab():set_title(line)
	end
      end),
    },
  },
  -- Disable default actions
  {
    key = "PageDown",
    mods = "CTRL",
    action = 'DisableDefaultAssignment'
  },
  -- Disable default actions
  {
    key = "PageUp",
    mods = "CTRL",
    action = 'DisableDefaultAssignment'
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
    {key = "LeftArrow", action = act.AdjustPaneSize({"Left", 1}) },
    {key = "DownArrow", action = act.AdjustPaneSize({"Down", 1}) },
    {key = "UpArrow", action = act.AdjustPaneSize({"Up", 1}) },
    {key = "RightArrow", action = act.AdjustPaneSize({"Right", 1}) },
    {key = "Escape", action = "PopKeyTable" },
    {key = "Enter", action = "PopKeyTable" },
  },
}

config.default_prog = {'zsh'}



return config
