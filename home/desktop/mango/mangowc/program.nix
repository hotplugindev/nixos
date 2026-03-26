{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  cfg = mango.mangowc;

  settingsLines = lib.mapAttrsToList (
    key: value:
    let
      rendered = if builtins.isBool value then (if value then "1" else "0") else builtins.toString value;
    in
    "${key}=${rendered}"
  ) cfg.settings.values;

  envLines = lib.mapAttrsToList (key: value: "env=${key},${value}") cfg.env;
  bindLines = cfg.bindLines;
  monitorLines = map (line: "monitorrule=${line}") cfg.monitors;
  ruleLines = map (line: "${line}") cfg.rules;

  includeLines = lib.concatMapStringsSep "\n" (file: "source=./dms/${file}") cfg.dmsIncludes.files;

  mangoConfigText = lib.concatStringsSep "\n" [
    cfg.settings.base
    (lib.concatStringsSep "\n" envLines)
    (lib.concatStringsSep "\n" settingsLines)
    (lib.concatStringsSep "\n" monitorLines)
    (lib.concatStringsSep "\n" ruleLines)
    (lib.concatStringsSep "\n" bindLines)
    (lib.optionalString cfg.dmsIncludes.enable includeLines)
    cfg.settings.extra
    "exec-once=~/.config/mango/autostart.sh"
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
      settings = mangoConfigText;
      autostart_sh = autostartScript;
    };
  };
}
