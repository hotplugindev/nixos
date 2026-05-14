{ lib, config, pkgs, ... }:
let
  greetdCfg = config.gb.desktop.greetd;
in
{
  options = {
    gb.desktop.greetd.enable = lib.mkEnableOption "Enable greetd with gtkgreet";
  };
  config = lib.mkIf greetdCfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -c Mango";
          user = "greeter";
        };
      };
    };
    environment.systemPackages = [ pkgs.greetd.gtkgreet pkgs.cage ];
  };
}