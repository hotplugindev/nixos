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
    ./plugins/default.nix
    ./wallpaper.nix
  ];
}
