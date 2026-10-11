{
  lib,
  config,
  ...
}:
let
  dms = config.gb.home.desktopshells.dms;
  mango = config.gb.home.desktop.mango;
  mangowcEnabled = mango.enable && mango.mangowc.enable;
  includeFiles = lib.escapeShellArgs dms.compositors.mango.includes.files;
in
{
  options.gb.home.desktopshells.dms.compositors.mango = {
    enable = lib.mkEnableOption "Enable DMS MangoWC compositor integration";

    includes = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Source DMS-managed MangoWC snippets from `~/.config/mango/dms/`.";
      };

      files = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [
          "colors.conf"
          "outputs.conf"
          "layout.conf"
          "cursor.conf"
          "binds.conf"
        ];
        description = "DMS snippet filenames bootstrapped and sourced into MangoWC.";
      };
    };

    binds = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Inject DMS keybindings into MangoWC via bindLinesExtra.";
      };
    };
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.dms.compositors.mango.enable = lib.mkDefault (dms.enable && mangowcEnabled);
    }

    (lib.mkIf (dms.enable && dms.compositors.mango.enable) {
      gb.home.desktopshells.dms.service.target = lib.mkDefault mango.mangowc.startupTarget;
    })

    (lib.mkIf (dms.enable && dms.compositors.mango.enable && dms.compositors.mango.includes.enable) {
      gb.home.desktop.mango.mangowc.settings.sourceFiles = map (
        file: "~/.config/mango/dms/${file}"
      ) dms.compositors.mango.includes.files;

      home.activation.mangoDmsIncludeBootstrap = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        mkdir -p "$HOME/.config/mango/dms"
        for include_file in ${includeFiles}; do
          if [ ! -e "$HOME/.config/mango/dms/$include_file" ]; then
            : > "$HOME/.config/mango/dms/$include_file"
          fi
        done

        dms_dir="$HOME/.config/mango/dms"
        if [ -f "$dms_dir/colors.conf" ]; then
          sed -i \
            -e 's/^bordercolor/border_color/' \
            -e 's/^focuscolor/focus_color/' \
            -e 's/^urgentcolor/urgent_color/' \
            "$dms_dir/colors.conf"
        fi
        if [ -f "$dms_dir/layout.conf" ]; then
          sed -i \
            -e 's/^borderpx/border_px/' \
            -e 's/^gappih/gap_inner_horizontal/' \
            -e 's/^gappiv/gap_inner_vertical/' \
            -e 's/^gappoh/gap_outer_horizontal/' \
            -e 's/^gappov/gap_outer_vertical/' \
            "$dms_dir/layout.conf"
        fi
      '';
    })

    (lib.mkIf (dms.enable && dms.compositors.mango.enable && dms.compositors.mango.binds.enable) {
      gb.home.desktop.mango.mangowc.systemBinds.enable = lib.mkForce false;

      gb.home.desktop.mango.mangowc.bindLinesExtra = [
        "bind=SUPER,Space,spawn,dms ipc call launcher toggle"
        "bind=SUPER,M,spawn,dms ipc call lock lock"
        "bind=SUPER,V,spawn_shell,dms ipc call clipboard toggle"
        "bind=SUPER+SHIFT,V,spawn,dms clipboard clear"
        "bind=NONE,Print,spawn_shell,dms screenshot"
        "bind=CTRL,Print,spawn_shell,dms screenshot full"
        "bind=ALT,Print,spawn_shell,dms screenshot window"
        "bind=NONE,XF86AudioMute,spawn,dms ipc call audio mute"
        "bind=NONE,XF86AudioRaiseVolume,spawn,dms ipc call audio increment 5"
        "bind=NONE,XF86AudioLowerVolume,spawn,dms ipc call audio decrement 5"
        "bind=NONE,XF86MonBrightnessUp,spawn,dms ipc call brightness increment 5 \"\""
        "bind=NONE,XF86MonBrightnessDown,spawn,dms ipc call brightness decrement 5 \"\""
        "bind=NONE,XF86AudioPlay,spawn,dms ipc call mpris playPause"
        "bind=NONE,XF86AudioNext,spawn,dms ipc call mpris next"
        "bind=NONE,XF86AudioPrev,spawn,dms ipc call mpris previous"
        "switchbind=fold,spawn,dms ipc call lock lock"
      ];
    })
  ];
}
