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
    sloppyfocus = 1;
    warpcursor = 1;
    drag_tile_to_tile = 1;
    single_scratchpad = 1;
    cursor_size = 24;
    cursor_theme = "Adwaita";
    gappih = 5;
    gappiv = 5;
    gappoh = 10;
    gappov = 10;
    borderpx = 2;
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
  monitorLines = map (line: "monitorrule=${line}") cfg.monitors;
  ruleLines = map (line: "${line}") cfg.rules;

  includeLines = lib.concatMapStringsSep "\n" (
    file: "source-optional=~/.config/mango/dms/${file}"
  ) cfg.dmsIncludes.files;

  mangoExtraConfigText = lib.concatStringsSep "\n" [
    cfg.settings.base
    (lib.concatStringsSep "\n" envLines)
    (lib.concatStringsSep "\n" monitorLines)
    (lib.concatStringsSep "\n" ruleLines)
    (lib.concatStringsSep "\n" bindLines)
    (lib.optionalString cfg.dmsIncludes.enable includeLines)
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
