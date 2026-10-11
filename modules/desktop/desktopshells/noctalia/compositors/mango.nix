{
  lib,
  config,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  mango = config.gb.home.desktop.mango;
  mangowcEnabled = mango.enable && mango.mangowc.enable;
  noctaliaExe = lib.getExe noctalia.package;
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
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.noctalia.compositors.mango.enable = lib.mkDefault (noctalia.enable && mangowcEnabled);
    }

    (lib.mkIf (noctalia.enable && noctalia.compositors.mango.enable) {
      gb.home.desktopshells.noctalia.service.target = lib.mkDefault mango.mangowc.startupTarget;
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
        "switchbind=fold,spawn,${noctaliaExe} msg session lock"
      ];
    })
  ];
}
