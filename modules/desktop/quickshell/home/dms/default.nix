{
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    ./options/default.nix
    ./program/default.nix
    ./features/default.nix
    ./wallpaper.nix
  ];
}
