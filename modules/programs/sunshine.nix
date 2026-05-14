{ lib, config, ... }:
let
  sunshine = config.gb.programs.sunshine;
in
{
  options = {
    gb.programs.sunshine.enable = lib.mkEnableOption "Enable sunshine service";
  };
  config = lib.mkIf sunshine.enable {
    services.sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}