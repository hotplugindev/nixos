{ lib, config, ... }:
let
  requests = config.gb.requires.system.desktop.dconf;
in
{
  config = lib.mkIf (requests != [ ]) {
    programs.dconf.enable = true;
  };
}
