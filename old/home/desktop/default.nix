{ lib, config, ... }:
let
  desktop = config.gb.home.desktop;
in
{
  imports = [
    ./mango/default.nix
    ./terminals/default.nix
    ./gtk/default.nix
    ./fonts/default.nix
  ];

  options = {
    gb.home.desktop.enable = lib.mkEnableOption "Enable desktop modules";
  };

  config = {
    gb.home.desktop.enable = lib.mkDefault true;

    gb.home.desktop.mango.enable = lib.mkDefault desktop.enable;
    gb.home.desktop.terminals.enable = lib.mkDefault desktop.enable;
    gb.home.desktop.gtk.enable = lib.mkDefault desktop.enable;
    gb.home.desktop.fonts.enable = lib.mkDefault desktop.enable;
  };
}
