{
  lib,
  config,
  pkgs,
  ...
}:
let
  zed = config.gb.home.dev.editors.zed;
in
{
  options = {
    gb.home.dev.editors.zed.enable = lib.mkEnableOption "Enable Zed";
  };

  config = lib.mkIf zed.enable {
    home.packages = [
      pkgs.zed-editor
    ];
  };
}
