{ lib, config, ... }:
let
  upowerCfg = config.gb.desktop.dconf;
in
{
  options = {
    gb.desktop.upower.enable = lib.mkEnableOption "Enable upower";
  };
  config = lib.mkIf upowerCfg.enable {
    services.upower.enable = true;
  };
}
