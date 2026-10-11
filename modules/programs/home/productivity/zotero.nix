{
  lib,
  config,
  pkgs,
  ...
}:
let
  zotero = config.gb.home.programs.productivity.zotero;
in
{
  options = {
    gb.home.programs.productivity.zotero.enable = lib.mkEnableOption "Enable zotero";
  };

  config = lib.mkIf zotero.enable {
    home.packages = [
      pkgs.zotero
    ];
  };
}
