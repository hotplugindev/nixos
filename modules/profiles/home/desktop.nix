{ lib, config, ... }:
let
  desktops = import ../../core/desktops.nix;
  shells = import ../../core/shells.nix;
  enabled = lib.elem "desktop" config.gb.host.roles;
  requester = "profiles.home.desktop";
  dname = config.gb.host.desktop;
  sname = config.gb.host.desktopShell;
  dentry = desktops.${dname} or null;
  sentry = shells.${sname} or null;
  desktopActive = enabled && dentry != null && !dentry.deferred;
  shellActive = enabled && sentry != null && !sentry.deferred;
  homeRequests = if desktopActive then dentry.homeRequests else [ ];
  activeSessionTarget = if desktopActive then dentry.sessionTarget else "graphical-session.target";
  activeCustomSessionTarget = desktopActive && dentry.customSessionTarget;
in
{
  options.gb.home.desktop = {
    activeSessionTarget = lib.mkOption {
      type = lib.types.str;
      default = activeSessionTarget;
      readOnly = true;
      description = "Systemd user target of the active compositor session.";
    };

    activeCustomSessionTarget = lib.mkOption {
      type = lib.types.bool;
      default = activeCustomSessionTarget;
      readOnly = true;
      description = "Whether the active compositor needs its session target created by this repo.";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf enabled {
      gb.requires.home.theme = [ requester ];
      gb.requires.home.xdg = [ requester ];
      gb.requires.home.terminal = [ requester ];

      wayland.systemd.target = lib.mkDefault activeSessionTarget;
    })

    (lib.mkIf desktopActive {
      gb.home.desktop.${dname}.enable = true;
      gb.requires.home.desktop = lib.genAttrs homeRequests (_: [ requester ]);
    })

    (lib.mkIf (shellActive && sname == "dms") {
      gb.home.desktopshells.dms.enable = true;
      gb.requires.home.desktopshells.dms = [ requester ];
    })

    (lib.mkIf (shellActive && sname == "noctalia") {
      gb.home.desktopshells.noctalia.enable = true;
      gb.requires.home.desktopshells.noctalia = [ requester ];
    })
  ];
}
