{
  lib,
  config,
  pkgs,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  mango = config.gb.home.desktop.mango;
  mangowcEnabled = mango.enable && mango.mangowc.enable;
  noctaliaExe = lib.getExe noctalia.package;

  noctaliaMangoSync = pkgs.writeScriptBin "noctalia-mango-sync" ''
    #!${pkgs.python3}/bin/python3
    import os
    import json
    import subprocess

    config_dir = os.path.expanduser("~/.config/mango")
    os.makedirs(config_dir, exist_ok=True)
    theme_file = os.path.join(config_dir, "noctalia.conf")
    settings_file = os.path.expanduser("~/.local/state/noctalia/settings.toml")
    wallpaper_path = os.path.expanduser("~/.config/noctalia/wallpapers/default.png")

    colors = {}
    scheme_source = "builtin"
    scheme_name = "Gruvbox"

    try:
        if os.path.exists(settings_file):
            with open(settings_file, "r") as f:
                lines = f.readlines()
            in_theme = False
            for line in lines:
                stripped = line.strip()
                if stripped == "[theme]":
                    in_theme = True
                elif stripped.startswith("["):
                    in_theme = False
                elif in_theme:
                    if stripped.startswith("community_palette"):
                        scheme_source = "community"
                        scheme_name = stripped.split("=")[1].strip().strip('"').strip("'")
                    elif stripped.startswith("builtin"):
                        scheme_source = "builtin"
                        scheme_name = stripped.split("=")[1].strip().strip('"').strip("'")

        if scheme_source == "community":
            palette_file = os.path.expanduser(f"~/.local/state/noctalia/community-palettes/{scheme_name}.json")
            if os.path.exists(palette_file):
                with open(palette_file, "r") as pf:
                    data = json.load(pf)
                    dark_data = data.get("dark", {})
                    colors = {
                        "surface": dark_data.get("mSurface", "#1d2021"),
                        "outline": dark_data.get("mOutline", "#504945"),
                        "primary": dark_data.get("mPrimary", "#d79921"),
                        "secondary": dark_data.get("mSecondary", "#83a598"),
                        "tertiary": dark_data.get("mTertiary", "#b8bb26"),
                        "error": dark_data.get("mError", "#fb4934"),
                        "on_surface": dark_data.get("mOnSurface", "#ebdbb2"),
                        "on_primary": dark_data.get("mOnPrimary", "#1d2021"),
                        "surface_container_high": dark_data.get("mSurfaceVariant", "#282828"),
                    }
    except Exception:
        pass

    if not colors:
        try:
            out = subprocess.check_output(
                ["${noctaliaExe}", "theme", wallpaper_path, "--dark"],
                stderr=subprocess.DEVNULL,
            )
            raw = json.loads(out)
            colors = {
                "surface": raw.get("surface", "#1d2021"),
                "outline": raw.get("outline", "#504945"),
                "primary": raw.get("primary", "#d79921"),
                "secondary": raw.get("secondary", "#83a598"),
                "tertiary": raw.get("tertiary", "#b8bb26"),
                "error": raw.get("error", "#fb4934"),
                "on_surface": raw.get("on_surface", "#ebdbb2"),
                "on_primary": raw.get("on_primary", "#1d2021"),
                "surface_container_high": raw.get("surface_container_high", "#282828"),
            }
        except Exception:
            colors = {
                "surface": "#1d2021",
                "outline": "#504945",
                "primary": "#d79921",
                "secondary": "#83a598",
                "tertiary": "#b8bb26",
                "error": "#fb4934",
                "on_surface": "#ebdbb2",
                "on_primary": "#1d2021",
                "surface_container_high": "#282828",
            }

    def clean(c):
        return c.lstrip("#").lower()

    lines = [
        "# Noctalia Theme for Mango",
        "# Generated automatically by noctalia-mango-sync",
        f"root_color = 0x{clean(colors['surface'])}ff",
        f"border_color = 0x{clean(colors['outline'])}88",
        f"drop_color = 0x{clean(colors['primary'])}80",
        f"split_color = 0x{clean(colors['tertiary'])}ff",
        f"focus_color = 0x{clean(colors['primary'])}ff",
        f"maximized_screen_color = 0x{clean(colors['secondary'])}ff",
        f"urgent_color = 0x{clean(colors['error'])}ff",
        f"scratchpad_color = 0x{clean(colors['tertiary'])}ff",
        f"global_color = 0x{clean(colors.get('primary_container', colors['primary']))}ff",
        f"overlay_color = 0x{clean(colors.get('secondary_container', colors['secondary']))}ff",
        f"group_bar_decorate_fg_color = 0x{clean(colors['on_surface'])}ff",
        f"group_bar_decorate_bg_color = 0x{clean(colors['surface_container_high'])}ff",
        f"group_bar_decorate_focus_fg_color = 0x{clean(colors['on_primary'])}ff",
        f"group_bar_decorate_focus_bg_color = 0x{clean(colors['primary'])}ff",
        f"group_bar_decorate_border_color = 0x{clean(colors['outline'])}ff",
        f"tab_bar_decorate_fg_color = 0x{clean(colors['on_surface'])}ff",
        f"tab_bar_decorate_bg_color = 0x{clean(colors['surface_container_high'])}ff",
        f"tab_bar_decorate_focus_fg_color = 0x{clean(colors['on_primary'])}ff",
        f"tab_bar_decorate_focus_bg_color = 0x{clean(colors['primary'])}ff",
        f"tab_bar_decorate_border_color = 0x{clean(colors['outline'])}ff",
        "",
    ]
    conf = "\n".join(lines)

    with open(theme_file, "w") as f:
        f.write(conf)

    subprocess.run(["mmsg", "dispatch", "reload_config"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
  '';
in
{
  options.gb.home.desktopshells.noctalia.compositors.mango = {
    enable = lib.mkEnableOption "Enable Noctalia MangoWC compositor integration";

    binds = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Inject Noctalia IPC keybindings into MangoWC via bindLinesExtra.";
      };
    };

    styling = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Inject shell-owned visual styling (rounded corners, border radius) into MangoWC.";
      };

      borderRadius = lib.mkOption {
        type = lib.types.int;
        default = 12;
        description = "Window corner radius in pixels.";
      };
    };

    sync = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Dynamically synchronize Noctalia palette and colors to MangoWC.";
      };
    };
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.noctalia.compositors.mango.enable = lib.mkDefault (noctalia.enable && mangowcEnabled);
    }

    (lib.mkIf (noctalia.enable && noctalia.compositors.mango.enable) {
      gb.home.desktopshells.noctalia.service.target = lib.mkDefault mango.mangowc.startupTarget;
    })

    (lib.mkIf (noctalia.enable && noctalia.compositors.mango.enable && noctalia.compositors.mango.styling.enable) {
      gb.home.desktop.mango.mangowc.settings.values.border_radius = lib.mkDefault noctalia.compositors.mango.styling.borderRadius;
      gb.home.desktop.mango.mangowc.settings.values.no_radius_when_single = lib.mkDefault 0;
    })

    (lib.mkIf (noctalia.enable && noctalia.compositors.mango.enable && noctalia.compositors.mango.sync.enable) {
      gb.home.desktop.mango.mangowc.settings.sourceFiles = [
        "~/.config/mango/noctalia.conf"
      ];

      home.packages = [ noctaliaMangoSync ];

      # Trigger sync whenever Noctalia theme or colors change
      gb.home.desktopshells.noctalia.config.hooks = {
        colors_changed = [ (lib.getExe noctaliaMangoSync) ];
        theme_mode_changed = [ (lib.getExe noctaliaMangoSync) ];
        wallpaper_changed = [ (lib.getExe noctaliaMangoSync) ];
      };

      home.activation.mangoNoctaliaThemeSync = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${lib.getExe noctaliaMangoSync} || true
      '';
    })

    (lib.mkIf (noctalia.enable && noctalia.compositors.mango.enable && noctalia.compositors.mango.binds.enable) {
      gb.home.desktop.mango.mangowc.systemBinds.enable = lib.mkForce false;

      gb.home.desktop.mango.mangowc.bindLinesExtra = [
        "bind=SUPER,Space,spawn,${noctaliaExe} msg panel-toggle launcher"
        "bind=SUPER,M,spawn,${noctaliaExe} msg session lock"
        "bind=SUPER,V,spawn,${noctaliaExe} msg panel-toggle clipboard"
        "bind=SUPER+SHIFT,V,spawn,${noctaliaExe} msg clipboard-clear"
        "bind=NONE,Print,spawn,${noctaliaExe} msg screenshot-region"
        "bind=CTRL,Print,spawn,${noctaliaExe} msg screenshot-fullscreen"
        "bind=ALT,Print,spawn,${noctaliaExe} msg screenshot-annotate"
        "bind=NONE,XF86AudioMute,spawn,${noctaliaExe} msg volume-mute"
        "bind=NONE,XF86AudioRaiseVolume,spawn,${noctaliaExe} msg volume-up 5"
        "bind=NONE,XF86AudioLowerVolume,spawn,${noctaliaExe} msg volume-down 5"
        "bind=NONE,XF86MonBrightnessUp,spawn,${noctaliaExe} msg brightness-up"
        "bind=NONE,XF86MonBrightnessDown,spawn,${noctaliaExe} msg brightness-down"
        "bind=NONE,XF86AudioPlay,spawn,${noctaliaExe} msg media toggle"
        "bind=NONE,XF86AudioNext,spawn,${noctaliaExe} msg media next"
        "bind=NONE,XF86AudioPrev,spawn,${noctaliaExe} msg media previous"
        "switchbind=lid:on,spawn,${noctaliaExe} msg session lock"
      ];
    })
  ];
}
