{ inputs, lib, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    ./options/default.nix
    ./program/default.nix
    ./wallpaper.nix
    ./services.nix
    ./compositors/mango.nix
  ];

  options.gb.home.desktopshells.dms.enable = lib.mkEnableOption "Enable DankMaterialShell desktop shell";
}
