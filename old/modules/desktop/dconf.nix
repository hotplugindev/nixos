{ lib, config, ... }:
let
  dconfCfg = config.gb.desktop.dconf;
in
{
  options = {
    gb.desktop.dconf.enable = lib.mkEnableOption "Enable dconf";
  };
  config = lib.mkIf dconfCfg.enable {
    programs.dconf.enable = true;
  };
}