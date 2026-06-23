{ lib, config, ... }:
let
  requests = config.gb.requires.system.desktop.xwayland;
in
{
  config = lib.mkIf (requests != [ ]) {
    programs.xwayland.enable = true;
  };
}
