{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  cfg = mango.mangowc;

  defaultSettings = {
    xwayland_persistence = 1;
    focus_on_activate = 1;
    sloppy_focus = 1;
    warp_cursor = 1;
    drag_tile_to_tile = 1;
    single_scratchpad = 1;
    cursor_size = 24;
    cursor_theme = "Adwaita";
    gap_inner_horizontal = 5;
    gap_inner_vertical = 5;
    gap_outer_horizontal = 10;
    gap_outer_vertical = 10;
    border_px = 2;
    enable_hotarea = false;
  };

  finalSettings = defaultSettings // cfg.settings.values;

  settingsLines = lib.mapAttrsToList (
    key: value:
    let
      rendered = if builtins.isBool value then (if value then "1" else "0") else builtins.toString value;
    in
    "${key}=${rendered}"
  ) finalSettings;

  envLines = lib.mapAttrsToList (key: value: "env=${key},${value}") cfg.env;
  bindLines = cfg.bindLines ++ cfg.bindLinesExtra;
  monitorLines = map (line: "monitor_rule=${line}") cfg.monitors;
  ruleLines = map (line: "${line}") cfg.rules;

  sourceLines = lib.concatMapStringsSep "\n" (
    file: "source_optional=${file}"
  ) cfg.settings.sourceFiles;

  mangoExtraConfigText = lib.concatStringsSep "\n" [
    cfg.settings.base
    (lib.concatStringsSep "\n" envLines)
    (lib.concatStringsSep "\n" monitorLines)
    (lib.concatStringsSep "\n" ruleLines)
    (lib.concatStringsSep "\n" bindLines)
    sourceLines
    cfg.settings.extra
  ];

  autostartScript = lib.concatStringsSep "\n" [
    "#!/usr/bin/env bash"
    "set +e"
    ""
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_DATA_DIRS"
    "systemctl --user start ${cfg.startupTarget}"
    (lib.concatStringsSep "\n" cfg.autostart.commands)
    cfg.autostart.extra
  ];
in
{
  config = lib.mkIf (mango.enable && mango.mangowc.enable) {
    wayland.windowManager.mango = {
      enable = true;
      settings = finalSettings;
      extraConfig = lib.concatStringsSep "\n" [
        mangoExtraConfigText
        (lib.concatStringsSep "\n" settingsLines)
      ];
      autostart_sh = autostartScript;
    };
  };
}
