{ lib, config, ... }:
let
  gvfs = config.gb.system.services.gvfs;
in
{
  options = {
    gb.system.services.gvfs.enable = lib.mkEnableOption "Enable gvfs";
  };

  config = {
    services.gvfs.enable = lib.mkIf gvfs.enable true;
  };
}
