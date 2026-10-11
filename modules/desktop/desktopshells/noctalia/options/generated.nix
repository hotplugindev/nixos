{ lib, ... }:
let
  inherit (lib) types mkOption;
in
{
  options.gb.home.desktopshells.noctalia.config = {
    accessibility = {
      high_contrast = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `accessibility.high_contrast`."; };
      ui_scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `accessibility.ui_scale`."; };
    };
    audio = {
      enable_overdrive = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `audio.enable_overdrive`."; };
      enable_sounds = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `audio.enable_sounds`."; };
      notification_sound = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `audio.notification_sound`."; };
      sound_volume = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `audio.sound_volume`."; };
      volume_change_sound = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `audio.volume_change_sound`."; };
    };
    backdrop = {
      blur_intensity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `backdrop.blur_intensity`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `backdrop.enabled`."; };
      tint_intensity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `backdrop.tint_intensity`."; };
    };
    bar = {
      order = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `bar.order`."; };
    };
    battery = {
      warning_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `battery.warning_threshold`."; };
    };
    brightness = {
      enable_ddcutil = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `brightness.enable_ddcutil`."; };
      ignore_mmids = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `brightness.ignore_mmids`."; };
      minimum_brightness = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `brightness.minimum_brightness`."; };
      sync_all_monitors = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `brightness.sync_all_monitors`."; };
    };
    calendar = {
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `calendar.enabled`."; };
      event_date_format = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `calendar.event_date_format`."; };
      event_time_format = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `calendar.event_time_format`."; };
      refresh_minutes = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `calendar.refresh_minutes`."; };
    };
    control_center = {
      calendar = {
        show_events_card = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `control_center.calendar.show_events_card`."; };
        show_week_numbers = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `control_center.calendar.show_week_numbers`."; };
      };
      hidden_tabs = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `control_center.hidden_tabs`."; };
      shortcuts = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `control_center.shortcuts`."; };
      show_session_button = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `control_center.show_session_button`."; };
      show_shortcut_labels = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `control_center.show_shortcut_labels`."; };
      sidebar = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `control_center.sidebar`."; };
      sidebar_section = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `control_center.sidebar_section`."; };
      width = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `control_center.width`."; };
    };
    desktop_widgets = {
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `desktop_widgets.enabled`."; };
      grid = {
        cell_size = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `desktop_widgets.grid.cell_size`."; };
        major_interval = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `desktop_widgets.grid.major_interval`."; };
        visible = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `desktop_widgets.grid.visible`."; };
      };
      schema_version = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `desktop_widgets.schema_version`."; };
    };
    dock = {
      active_monitor_only = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.active_monitor_only`."; };
      active_opacity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.active_opacity`."; };
      active_scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.active_scale`."; };
      auto_hide = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.auto_hide`."; };
      background_opacity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.background_opacity`."; };
      border = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `dock.border`."; };
      border_width = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.border_width`."; };
      concave_edge_corners = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.concave_edge_corners`."; };
      cross_axis_padding = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.cross_axis_padding`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.enabled`."; };
      icon_size = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.icon_size`."; };
      inactive_opacity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.inactive_opacity`."; };
      inactive_scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.inactive_scale`."; };
      item_spacing = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.item_spacing`."; };
      launcher_custom_image = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `dock.launcher_custom_image`."; };
      launcher_custom_image_colorize = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.launcher_custom_image_colorize`."; };
      launcher_icon = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `dock.launcher_icon`."; };
      launcher_position = mkOption { type = types.nullOr (types.enum [ "none" "start" "end" ]); default = null; description = "Noctalia config key `dock.launcher_position`. One of: none | start | end."; };
      layer = mkOption { type = types.nullOr (types.enum [ "background" "bottom" "top" "overlay" ]); default = null; description = "Noctalia config key `dock.layer`. One of: background | bottom | top | overlay."; };
      magnification = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.magnification`."; };
      magnification_scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.magnification_scale`."; };
      main_axis_padding = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.main_axis_padding`."; };
      margin_edge = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.margin_edge`."; };
      margin_ends = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.margin_ends`."; };
      monitors = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `dock.monitors`."; };
      pinned = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `dock.pinned`."; };
      position = mkOption { type = types.nullOr (types.enum [ "top" "bottom" "left" "right" ]); default = null; description = "Noctalia config key `dock.position`. One of: top | bottom | left | right."; };
      radius = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.radius`."; };
      radius_bottom_left = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.radius_bottom_left`."; };
      radius_bottom_right = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.radius_bottom_right`."; };
      radius_top_left = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.radius_top_left`."; };
      radius_top_right = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `dock.radius_top_right`."; };
      reserve_space = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.reserve_space`."; };
      shadow = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.shadow`."; };
      show_dots = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.show_dots`."; };
      show_instance_count = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.show_instance_count`."; };
      show_running = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.show_running`."; };
      smart_auto_hide = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `dock.smart_auto_hide`."; };
    };
    hooks = {
      battery_charging = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.battery_charging`."; };
      battery_discharging = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.battery_discharging`."; };
      battery_percentage_changed = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.battery_percentage_changed`."; };
      battery_plugged = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.battery_plugged`."; };
      bluetooth_disabled = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.bluetooth_disabled`."; };
      bluetooth_enabled = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.bluetooth_enabled`."; };
      colors_changed = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.colors_changed`."; };
      logging_out = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.logging_out`."; };
      power_profile_changed = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.power_profile_changed`."; };
      rebooting = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.rebooting`."; };
      session_locked = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.session_locked`."; };
      session_unlocked = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.session_unlocked`."; };
      shutting_down = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.shutting_down`."; };
      started = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.started`."; };
      theme_mode_changed = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.theme_mode_changed`."; };
      wallpaper_changed = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.wallpaper_changed`."; };
      wifi_disabled = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.wifi_disabled`."; };
      wifi_enabled = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `hooks.wifi_enabled`."; };
    };
    hot_corners = {
      bottom_left = {
        action = mkOption { type = types.nullOr (types.enum [ "none" "launcher" "window-switcher" "control-center" "command" ]); default = null; description = "Noctalia config key `hot_corners.bottom_left.action`. One of: none | launcher | window-switcher | control-center | command."; };
        command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `hot_corners.bottom_left.command`."; };
      };
      bottom_right = {
        action = mkOption { type = types.nullOr (types.enum [ "none" "launcher" "window-switcher" "control-center" "command" ]); default = null; description = "Noctalia config key `hot_corners.bottom_right.action`. One of: none | launcher | window-switcher | control-center | command."; };
        command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `hot_corners.bottom_right.command`."; };
      };
      delay_ms = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `hot_corners.delay_ms`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `hot_corners.enabled`."; };
      top_left = {
        action = mkOption { type = types.nullOr (types.enum [ "none" "launcher" "window-switcher" "control-center" "command" ]); default = null; description = "Noctalia config key `hot_corners.top_left.action`. One of: none | launcher | window-switcher | control-center | command."; };
        command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `hot_corners.top_left.command`."; };
      };
      top_right = {
        action = mkOption { type = types.nullOr (types.enum [ "none" "launcher" "window-switcher" "control-center" "command" ]); default = null; description = "Noctalia config key `hot_corners.top_right.action`. One of: none | launcher | window-switcher | control-center | command."; };
        command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `hot_corners.top_right.command`."; };
      };
    };
    idle = {
      behavior = {
        lock = {
          action = mkOption { type = types.nullOr (types.enum [ "lock" "screen_off" "lock_and_suspend" ]); default = null; description = "Noctalia config key `idle.behavior.lock.action`. One of: lock | screen_off | lock_and_suspend."; };
          command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `idle.behavior.lock.command`."; };
          enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `idle.behavior.lock.enabled`."; };
          locked_timeout = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.behavior.lock.locked_timeout`."; };
          resume_command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `idle.behavior.lock.resume_command`."; };
          timeout = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.behavior.lock.timeout`."; };
        };
        lock-and-suspend = {
          action = mkOption { type = types.nullOr (types.enum [ "lock" "screen_off" "lock_and_suspend" ]); default = null; description = "Noctalia config key `idle.behavior.lock-and-suspend.action`. One of: lock | screen_off | lock_and_suspend."; };
          command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `idle.behavior.lock-and-suspend.command`."; };
          enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `idle.behavior.lock-and-suspend.enabled`."; };
          locked_timeout = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.behavior.lock-and-suspend.locked_timeout`."; };
          resume_command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `idle.behavior.lock-and-suspend.resume_command`."; };
          timeout = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.behavior.lock-and-suspend.timeout`."; };
        };
        screen-off = {
          action = mkOption { type = types.nullOr (types.enum [ "lock" "screen_off" "lock_and_suspend" ]); default = null; description = "Noctalia config key `idle.behavior.screen-off.action`. One of: lock | screen_off | lock_and_suspend."; };
          command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `idle.behavior.screen-off.command`."; };
          enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `idle.behavior.screen-off.enabled`."; };
          locked_timeout = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.behavior.screen-off.locked_timeout`."; };
          resume_command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `idle.behavior.screen-off.resume_command`."; };
          timeout = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.behavior.screen-off.timeout`."; };
        };
      };
      behavior_order = mkOption { type = types.nullOr (types.listOf (types.enum [ "lock" "screen-off" "lock-and-suspend" ])); default = null; description = "Noctalia config key `idle.behavior_order`. One of: lock | screen-off | lock-and-suspend."; };
      pre_action_fade_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `idle.pre_action_fade_seconds`."; };
    };
    keybinds = {
      cancel = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.cancel`."; };
      copy = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.copy`."; };
      delete = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.delete`."; };
      down = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.down`."; };
      left = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.left`."; };
      right = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.right`."; };
      save = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.save`."; };
      tab_next = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.tab_next`."; };
      tab_previous = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.tab_previous`."; };
      up = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.up`."; };
      validate = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `keybinds.validate`."; };
    };
    location = {
      address = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `location.address`."; };
      auto_locate = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `location.auto_locate`."; };
      custom_schedule = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `location.custom_schedule`."; };
      sunrise = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `location.sunrise`."; };
      sunset = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `location.sunset`."; };
    };
    lockscreen = {
      allow_empty_password = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen.allow_empty_password`."; };
      blur_intensity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `lockscreen.blur_intensity`."; };
      blurred_desktop = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen.blurred_desktop`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen.enabled`."; };
      fingerprint = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen.fingerprint`."; };
      lock_before_suspend = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen.lock_before_suspend`."; };
      monitors = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `lockscreen.monitors`."; };
      tint_intensity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `lockscreen.tint_intensity`."; };
      wallpaper = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `lockscreen.wallpaper`."; };
    };
    lockscreen_widgets = {
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen_widgets.enabled`."; };
      grid = {
        cell_size = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `lockscreen_widgets.grid.cell_size`."; };
        major_interval = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `lockscreen_widgets.grid.major_interval`."; };
        visible = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `lockscreen_widgets.grid.visible`."; };
      };
      schema_version = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `lockscreen_widgets.schema_version`."; };
      widget_order = mkOption { type = types.nullOr (types.listOf types.str); default = null; description = "Noctalia config key `lockscreen_widgets.widget_order`."; };
    };
    nightlight = {
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `nightlight.enabled`."; };
      force = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `nightlight.force`."; };
      temperature_day = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `nightlight.temperature_day`."; };
      temperature_night = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `nightlight.temperature_night`."; };
    };
    notification = {
      background_opacity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `notification.background_opacity`."; };
      border = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `notification.border`."; };
      collapse_on_dismiss = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `notification.collapse_on_dismiss`."; };
      enable_daemon = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `notification.enable_daemon`."; };
      history_retention_hours = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `notification.history_retention_hours`."; };
      layer = mkOption { type = types.nullOr (types.enum [ "background" "bottom" "top" "overlay" ]); default = null; description = "Noctalia config key `notification.layer`. One of: background | bottom | top | overlay."; };
      max_visible = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `notification.max_visible`."; };
      monitors = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `notification.monitors`."; };
      offset_x = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `notification.offset_x`."; };
      offset_y = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `notification.offset_y`."; };
      position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `notification.position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
      scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `notification.scale`."; };
      show_actions = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `notification.show_actions`."; };
      show_app_name = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `notification.show_app_name`."; };
    };
    osd = {
      background_opacity = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `osd.background_opacity`."; };
      border = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.border`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.enabled`."; };
      kinds = {
        bluetooth = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.bluetooth`."; };
        brightness = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.brightness`."; };
        caffeine = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.caffeine`."; };
        dnd = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.dnd`."; };
        keyboard_backlight = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.keyboard_backlight`."; };
        keyboard_layout = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.keyboard_layout`."; };
        lock_keys = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.lock_keys`."; };
        media = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.media`."; };
        nightlight = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.nightlight`."; };
        power_profile = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.power_profile`."; };
        privacy = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.privacy`."; };
        volume = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.volume`."; };
        volume_input = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.volume_input`."; };
        volume_output = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.volume_output`."; };
        wifi = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `osd.kinds.wifi`."; };
      };
      monitors = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `osd.monitors`."; };
      offset_x = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `osd.offset_x`."; };
      offset_y = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `osd.offset_y`."; };
      orientation = mkOption { type = types.nullOr (types.enum [ "horizontal" "vertical" ]); default = null; description = "Noctalia config key `osd.orientation`. One of: horizontal | vertical."; };
      position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `osd.position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
      position_vertical = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `osd.position_vertical`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
      scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `osd.scale`."; };
    };
    plugins = {
      auto_update = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `plugins.auto_update`."; };
      enabled = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `plugins.enabled`."; };
      source = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `plugins.source`."; };
    };
    shell = {
      animation = {
        enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.animation.enabled`."; };
        speed = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.animation.speed`."; };
      };
      app_icon_colorize = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.app_icon_colorize`."; };
      avatar_path = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.avatar_path`."; };
      button_borders = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.button_borders`."; };
      card_borders = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.card_borders`."; };
      clipboard_auto_paste = mkOption { type = types.nullOr (types.enum [ "off" "auto" "ctrl_v" "ctrl_shift_v" "shift_insert" ]); default = null; description = "Noctalia config key `shell.clipboard_auto_paste`. One of: off | auto | ctrl_v | ctrl_shift_v | shift_insert."; };
      clipboard_confirm_clear_history = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.clipboard_confirm_clear_history`."; };
      clipboard_enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.clipboard_enabled`."; };
      clipboard_history_max_entries = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.clipboard_history_max_entries`."; };
      clipboard_image_action_command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.clipboard_image_action_command`."; };
      clipboard_keep_from_closed_apps = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.clipboard_keep_from_closed_apps`."; };
      corner_radius_scale = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.corner_radius_scale`."; };
      date_format = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.date_format`."; };
      disable_mipmaps = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.disable_mipmaps`."; };
      external_ip_enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.external_ip_enabled`."; };
      font_family = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.font_family`."; };
      greeter_sync = {
        auto_sync = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.greeter_sync.auto_sync`."; };
      };
      input_borders = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.input_borders`."; };
      launch_apps_as_systemd_services = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launch_apps_as_systemd_services`."; };
      launch_apps_custom_command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.launch_apps_custom_command`."; };
      launcher = {
        app_grid = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.app_grid`."; };
        auto_paste = mkOption { type = types.nullOr (types.enum [ "off" "auto" "ctrl_v" "ctrl_shift_v" "shift_insert" ]); default = null; description = "Noctalia config key `shell.launcher.auto_paste`. One of: off | auto | ctrl_v | ctrl_shift_v | shift_insert."; };
        categories = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.categories`."; };
        compact = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.compact`."; };
        fetch_exchange_rates = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.fetch_exchange_rates`."; };
        pinned = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `shell.launcher.pinned`."; };
        provider_prefix = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.launcher.provider_prefix`."; };
        show_app_actions = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.show_app_actions`."; };
        show_app_origin_indicator = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.show_app_origin_indicator`."; };
        show_icons = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.show_icons`."; };
        sort_by_usage = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.launcher.sort_by_usage`."; };
      };
      mpris = {
        blacklist = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `shell.mpris.blacklist`."; };
      };
      niri_overview_type_to_launch_enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.niri_overview_type_to_launch_enabled`."; };
      offline_mode = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.offline_mode`."; };
      panel = {
        borders = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.borders`."; };
        clipboard_placement = mkOption { type = types.nullOr (types.enum [ "attached" "floating" ]); default = null; description = "Noctalia config key `shell.panel.clipboard_placement`. One of: attached | floating."; };
        clipboard_position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `shell.panel.clipboard_position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
        control_center_placement = mkOption { type = types.nullOr (types.enum [ "attached" "floating" ]); default = null; description = "Noctalia config key `shell.panel.control_center_placement`. One of: attached | floating."; };
        control_center_position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `shell.panel.control_center_position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
        floating_layer = mkOption { type = types.nullOr (types.enum [ "overlay" "top" ]); default = null; description = "Noctalia config key `shell.panel.floating_layer`. One of: overlay | top."; };
        floating_offset = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.panel.floating_offset`."; };
        launcher_placement = mkOption { type = types.nullOr (types.enum [ "attached" "floating" ]); default = null; description = "Noctalia config key `shell.panel.launcher_placement`. One of: attached | floating."; };
        launcher_position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `shell.panel.launcher_position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
        list_item_background = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.list_item_background`."; };
        open_near_click_clipboard = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.open_near_click_clipboard`."; };
        open_near_click_control_center = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.open_near_click_control_center`."; };
        open_near_click_launcher = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.open_near_click_launcher`."; };
        open_near_click_session = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.open_near_click_session`."; };
        open_near_click_wallpaper = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.open_near_click_wallpaper`."; };
        polkit_placement = mkOption { type = types.nullOr (types.enum [ "attached" "floating" ]); default = null; description = "Noctalia config key `shell.panel.polkit_placement`. One of: attached | floating."; };
        polkit_position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `shell.panel.polkit_position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
        session_placement = mkOption { type = types.nullOr (types.enum [ "attached" "floating" ]); default = null; description = "Noctalia config key `shell.panel.session_placement`. One of: attached | floating."; };
        session_position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `shell.panel.session_position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
        shadow = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.panel.shadow`."; };
        transparency_mode = mkOption { type = types.nullOr (types.enum [ "solid" "soft" "glass" ]); default = null; description = "Noctalia config key `shell.panel.transparency_mode`. One of: solid | soft | glass."; };
        wallpaper_placement = mkOption { type = types.nullOr (types.enum [ "attached" "floating" ]); default = null; description = "Noctalia config key `shell.panel.wallpaper_placement`. One of: attached | floating."; };
        wallpaper_position = mkOption { type = types.nullOr (types.enum [ "auto" "center" "top_left" "top_center" "top_right" "bottom_left" "bottom_center" "bottom_right" "left_center" "right_center" ]); default = null; description = "Noctalia config key `shell.panel.wallpaper_position`. One of: auto | center | top_left | top_center | top_right | bottom_left | bottom_center | bottom_right | left_center | right_center."; };
      };
      password_style = mkOption { type = types.nullOr (types.enum [ "default" "random" ]); default = null; description = "Noctalia config key `shell.password_style`. One of: default | random."; };
      polkit_agent = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.polkit_agent`."; };
      popup_borders = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.popup_borders`."; };
      popup_shadows = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.popup_shadows`."; };
      privacy = {
        cam_filter_regex = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.privacy.cam_filter_regex`."; };
        mic_filter_regex = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.privacy.mic_filter_regex`."; };
        screen_filter_regex = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.privacy.screen_filter_regex`."; };
      };
      screen_corners = {
        enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screen_corners.enabled`."; };
        size = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.screen_corners.size`."; };
      };
      screen_time_enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screen_time_enabled`."; };
      screenshot = {
        confirm_region = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.confirm_region`."; };
        copy_to_clipboard = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.copy_to_clipboard`."; };
        directory = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.screenshot.directory`."; };
        filename_pattern = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.screenshot.filename_pattern`."; };
        freeze_screen = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.freeze_screen`."; };
        pipe_command = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.screenshot.pipe_command`."; };
        pipe_to_command = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.pipe_to_command`."; };
        remember_last_region = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.remember_last_region`."; };
        save_to_file = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.save_to_file`."; };
        show_cursor = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.screenshot.show_cursor`."; };
      };
      session = {
        actions = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `shell.session.actions`."; };
        grid = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.session.grid`."; };
        grid_columns = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.session.grid_columns`."; };
        show_shortcuts = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.session.show_shortcuts`."; };
      };
      settings_show_advanced = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.settings_show_advanced`."; };
      settings_window_translucent = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.settings_window_translucent`."; };
      setup_wizard_enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.setup_wizard_enabled`."; };
      shadow = {
        alpha = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `shell.shadow.alpha`."; };
        direction = mkOption { type = types.nullOr (types.enum [ "center" "up" "down" "left" "right" "up_left" "up_right" "down_left" "down_right" ]); default = null; description = "Noctalia config key `shell.shadow.direction`. One of: center | up | down | left | right | up_left | up_right | down_left | down_right."; };
      };
      shared_gl_context = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.shared_gl_context`."; };
      show_location = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.show_location`."; };
      telemetry_enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.telemetry_enabled`."; };
      time_format = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `shell.time_format`."; };
      window_switcher = {
        mru = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `shell.window_switcher.mru`."; };
      };
    };
    storage = {
      key_file = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `storage.key_file`."; };
      key_source = mkOption { type = types.nullOr (types.enum [ "secret-service" "file" ]); default = null; description = "Noctalia config key `storage.key_source`. One of: secret-service | file."; };
    };
    system = {
      monitor = {
        cpu_freq_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_freq_activity_threshold`."; };
        cpu_freq_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_freq_critical_threshold`."; };
        cpu_poll_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_poll_seconds`."; };
        cpu_temp_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_temp_activity_threshold`."; };
        cpu_temp_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_temp_critical_threshold`."; };
        cpu_temp_sensor_path = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `system.monitor.cpu_temp_sensor_path`."; };
        cpu_usage_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_usage_activity_threshold`."; };
        cpu_usage_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.cpu_usage_critical_threshold`."; };
        disk_free_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_free_activity_threshold`."; };
        disk_free_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_free_critical_threshold`."; };
        disk_free_pct_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_free_pct_activity_threshold`."; };
        disk_free_pct_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_free_pct_critical_threshold`."; };
        disk_poll_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_poll_seconds`."; };
        disk_used_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_used_activity_threshold`."; };
        disk_used_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_used_critical_threshold`."; };
        disk_used_pct_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_used_pct_activity_threshold`."; };
        disk_used_pct_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.disk_used_pct_critical_threshold`."; };
        enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `system.monitor.enabled`."; };
        gpu_poll_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_poll_seconds`."; };
        gpu_temp_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_temp_activity_threshold`."; };
        gpu_temp_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_temp_critical_threshold`."; };
        gpu_usage_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_usage_activity_threshold`."; };
        gpu_usage_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_usage_critical_threshold`."; };
        gpu_vram_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_vram_activity_threshold`."; };
        gpu_vram_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.gpu_vram_critical_threshold`."; };
        memory_poll_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.memory_poll_seconds`."; };
        net_rx_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.net_rx_activity_threshold`."; };
        net_rx_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.net_rx_critical_threshold`."; };
        net_tx_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.net_tx_activity_threshold`."; };
        net_tx_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.net_tx_critical_threshold`."; };
        network_poll_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.network_poll_seconds`."; };
        ram_pct_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.ram_pct_activity_threshold`."; };
        ram_pct_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.ram_pct_critical_threshold`."; };
        swap_pct_activity_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.swap_pct_activity_threshold`."; };
        swap_pct_critical_threshold = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `system.monitor.swap_pct_critical_threshold`."; };
      };
    };
    theme = {
      builtin = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `theme.builtin`."; };
      community_palette = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `theme.community_palette`."; };
      custom_palette = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `theme.custom_palette`."; };
      mode = mkOption { type = types.nullOr (types.enum [ "dark" "light" ]); default = null; description = "Noctalia config key `theme.mode`. One of: dark | light."; };
      pure_black_dark = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `theme.pure_black_dark`."; };
      shell_mode = mkOption { type = types.nullOr (types.enum [ "follow" "dark" "light" ]); default = null; description = "Noctalia config key `theme.shell_mode`. One of: follow | dark | light."; };
      source = mkOption { type = types.nullOr (types.enum [ "builtin" "community" "custom" ]); default = null; description = "Noctalia config key `theme.source`. One of: builtin | community | custom."; };
      templates = {
        builtin_ids = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `theme.templates.builtin_ids`."; };
        community_ids = mkOption { type = types.nullOr (types.listOf types.anything); default = null; description = "Noctalia config key `theme.templates.community_ids`."; };
        enable_builtin_templates = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `theme.templates.enable_builtin_templates`."; };
        enable_community_templates = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `theme.templates.enable_community_templates`."; };
      };
      wallpaper_scheme = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `theme.wallpaper_scheme`."; };
    };
    wallpaper = {
      automation = {
        enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `wallpaper.automation.enabled`."; };
        interval_seconds = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `wallpaper.automation.interval_seconds`."; };
        order = mkOption { type = types.nullOr (types.enum [ "random" "sequential" ]); default = null; description = "Noctalia config key `wallpaper.automation.order`. One of: random | sequential."; };
        recursive = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `wallpaper.automation.recursive`."; };
      };
      directory = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `wallpaper.directory`."; };
      directory_dark = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `wallpaper.directory_dark`."; };
      directory_light = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `wallpaper.directory_light`."; };
      edge_smoothness = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `wallpaper.edge_smoothness`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `wallpaper.enabled`."; };
      fill_color = mkOption { type = types.nullOr (types.str); default = null; description = "Noctalia config key `wallpaper.fill_color`."; };
      fill_mode = mkOption { type = types.nullOr (types.enum [ "center" "crop" "fit" "stretch" "repeat" "span" ]); default = null; description = "Noctalia config key `wallpaper.fill_mode`. One of: center | crop | fit | stretch | repeat | span."; };
      per_monitor_directories = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `wallpaper.per_monitor_directories`."; };
      transition = mkOption { type = types.nullOr (types.listOf (types.enum [ "fade" "wipe" "disc" "stripes" "zoom" "honeycomb" ])); default = null; description = "Noctalia config key `wallpaper.transition`. One of: fade | wipe | disc | stripes | zoom | honeycomb."; };
      transition_duration = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `wallpaper.transition_duration`."; };
      transition_on_startup = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `wallpaper.transition_on_startup`."; };
    };
    weather = {
      effects = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `weather.effects`."; };
      enabled = mkOption { type = types.nullOr (types.bool); default = null; description = "Noctalia config key `weather.enabled`."; };
      refresh_minutes = mkOption { type = types.nullOr (types.number); default = null; description = "Noctalia config key `weather.refresh_minutes`."; };
      unit = mkOption { type = types.nullOr (types.enum [ "metric" "imperial" ]); default = null; description = "Noctalia config key `weather.unit`. One of: metric | imperial."; };
    };
  };
}
