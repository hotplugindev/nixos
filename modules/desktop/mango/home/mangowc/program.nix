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
    gap_inner_horizontal = 6;
    gap_inner_vertical = 6;
    gap_outer_horizontal = 10;
    gap_outer_vertical = 10;
    border_px = 0;
    border_radius = 10;
    no_radius_when_single = 0;
    no_border_when_single = 0;
    enable_hotarea = false;

    # Smooth window and layer blur (frosted glass aesthetic)
    blur = 1;
    blur_layer = 0;
    blur_optimized = 1;
    blur_params_radius = 6;
    blur_params_num_passes = 2;
    blur_params_noise = 0.02;
    blur_params_brightness = 0.9;
    blur_params_contrast = 0.9;
    blur_params_saturation = 1.15;

    # Elegant drop shadows with depth
    shadows = 1;
    layer_shadows = 1;
    shadow_only_floating = 0;
    shadows_size = 16;
    shadows_blur = 20;
    shadows_position_x = 0;
    shadows_position_y = 2;
    shadows_color = "0x00000066";

    # Subtle dimming on unfocused windows for focus immersion
    dim_enable = 1;
    dim_focused_color = "0x00000000";
    dim_unfocused_color = "0x00000018";

    # Fluid animations for windows and layer surfaces
    animations = 1;
    layer_animations = 1;
    animation_type_open = "zoom";
    animation_type_close = "slide";
    layer_animation_type_open = "slide";
    layer_animation_type_close = "slide";
    animation_fade_in = 1;
    animation_fade_out = 1;
    fade_in_begin_opacity = 0.4;
    fade_out_begin_opacity = 0.4;
    animation_duration_move = 260;
    animation_duration_open = 220;
    animation_duration_tag = 180;
    animation_duration_close = 180;
    animation_duration_focus = 140;
    animation_curve_move = "0.05, 0.9, 0.1, 1.05";
    animation_curve_open = "0.05, 0.9, 0.1, 1.05";
    animation_curve_tag = "0.05, 0.9, 0.1, 1.05";
    animation_curve_close = "0.3, 0, 0.8, 0.15";
    animation_curve_focus = "0.05, 0.9, 0.1, 1.05";

    # Default dark theme palette matching Gruvbox Dark / warm charcoal
    root_color = "0x1d2021ff";
    border_color = "0x3c3836aa";
    focus_color = "0xd79921ff";
    urgent_color = "0xfb4934ff";
    drop_color = "0xd7992166";
    split_color = "0xb8bb26ff";
    maximized_screen_color = "0x83a598ff";
    scratchpad_color = "0xd3869bff";
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
  bindLines =
    cfg.bindLines
    ++ lib.optionals cfg.systemBinds.enable cfg.systemBindLines
    ++ cfg.bindLinesExtra;
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
