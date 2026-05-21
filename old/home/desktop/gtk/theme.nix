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
    gb.home.desktop.gtk.theme = {
      enable = lib.mkEnableOption "Enable GTK theme setup";
      name = lib.mkOption {
        type = lib.types.str;
        default = "Adwaita-dark";
        description = "GTK theme name";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.gnome-themes-extra;
        description = "Package providing GTK theme";
      };
    };
  };

  config = lib.mkIf (gtkCfg.enable && gtkCfg.theme.enable) {
    gtk = {
      enable = true;
      theme = {
        name = gtkCfg.theme.name;
        package = gtkCfg.theme.package;
      };
    };
  };
}
