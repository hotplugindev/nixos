{ lib, config, ... }:
let
  regreetCfg = config.gb.desktop.regreet;
in
{
  options = {
    gb.desktop.regreet.enable = lib.mkEnableOption "Enable regreet";
  };
  config = lib.mkIf regreetCfg.enable {
    programs.regreet.enable = true;
  };
}