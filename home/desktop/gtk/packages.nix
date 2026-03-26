{
  lib,
  config,
  pkgs,
  ...
}:
let
  gtkCfg = config.gb.home.desktop.gtk;
in
{
  options = {
    gb.home.desktop.gtk.packages = {
      enable = lib.mkEnableOption "Enable GTK supporting packages";
      list = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          papirus-icon-theme
          adwaita-icon-theme
          hicolor-icon-theme
        ];
        description = "Desktop GTK related packages";
      };
    };
  };

  config = lib.mkIf (gtkCfg.enable && gtkCfg.packages.enable) {
    home.packages = gtkCfg.packages.list;
  };
}
