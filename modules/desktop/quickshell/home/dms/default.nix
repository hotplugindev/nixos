{
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    ./options/default.nix
    ./program/default.nix
    ./wallpaper.nix
  ];
}
