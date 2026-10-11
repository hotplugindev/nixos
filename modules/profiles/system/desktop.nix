{ lib, config, ... }:
let
  desktops = import ../../core/desktops.nix;
  enabled = lib.elem "desktop" config.gb.host.roles;
  requester = "profiles.system.desktop";
  name = config.gb.host.desktop;
  entry = desktops.${name} or null;
  active = enabled && entry != null && !entry.deferred;
  shellCmd = if config.gb.host.shell != "none" then config.gb.host.shell else "zsh";
  systemRequests = if active then entry.systemRequests else [ ];
in
{
  config = lib.mkMerge [
    (lib.mkIf active {
      gb.desktop.${name}.enable = true;

      gb.capabilities.system.desktop.greetd.sessionCommand = lib.mkDefault (
        entry.sessionCommand shellCmd
      );
      gb.capabilities.system.desktop.greetd.autologin = lib.mkDefault (
        config.gb.desktop.${name}.autologin
      );

      gb.requires.system.desktop = lib.genAttrs systemRequests (_: [ requester ]);
    })
  ];
}
