{
  lib,
  config,
  pkgs,
  ...
}:
let
  gnomeDisks = config.gb.home.tools.gnomeDisks;
in
{
  options = {
    gb.home.tools.gnomeDisks.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf gnomeDisks.enable {
    home.packages = [
      pkgs.gnome-disk-utility
    ];
  };
}
