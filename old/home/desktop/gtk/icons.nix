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
    gb.home.desktop.gtk.icons = {
      enable = lib.mkEnableOption "Enable GTK icon theme setup";
      name = lib.mkOption {
        type = lib.types.str;
        default = "Papirus-Dark";
        description = "GTK icon theme name";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.papirus-icon-theme;
        description = "Package providing icon theme";
      };
    };
  };

  config = lib.mkIf (gtkCfg.enable && gtkCfg.icons.enable) {
    gtk = {
      enable = true;
      iconTheme = {
        name = gtkCfg.icons.name;
        package = gtkCfg.icons.package;
      };
    };
  };
}
