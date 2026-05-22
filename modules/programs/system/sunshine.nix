{ lib, config, ... }:
let
  sunshine = config.gb.programs.system.sunshine;
in
{
  options.gb.programs.system.sunshine.enable = lib.mkEnableOption "Enable Sunshine service";

  config = lib.mkIf sunshine.enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
