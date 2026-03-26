{ lib, ... }:
{
  imports = [
    ./packages.nix
  ];

  options = {
    gb.home.desktop.fonts.enable = lib.mkEnableOption "Enable desktop fonts";
  };

  config = {
    gb.home.desktop.fonts.enable = lib.mkDefault true;
  };
}
