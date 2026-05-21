{
  lib,
  config,
  pkgs,
  ...
}:
let
  zip = config.gb.home.tools.filemanagment.zip;
in
{
  options = {
    gb.home.tools.filemanagment.zip.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf zip.enable {
    home.packages = [
      pkgs.zip
      pkgs.unzip
    ];
  };
}
