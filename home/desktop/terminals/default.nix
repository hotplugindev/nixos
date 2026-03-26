{ lib, ... }:
{
  imports = [
    ./foot/default.nix
  ];

  options = {
    gb.home.desktop.terminals.enable = lib.mkEnableOption "Enable desktop terminal modules";
  };

  config = {
    gb.home.desktop.terminals.enable = lib.mkDefault true;
  };
}
