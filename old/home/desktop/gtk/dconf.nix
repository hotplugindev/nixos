{
  lib,
  config,
  ...
}:
let
  gtkCfg = config.gb.home.desktop.gtk;
in
{
  options = {
    gb.home.desktop.gtk.dconf.enable = lib.mkEnableOption "Enable GTK dconf defaults";
  };

  config = lib.mkIf (gtkCfg.enable && gtkCfg.dconf.enable) {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        icon-theme = gtkCfg.icons.name;
        color-scheme = "prefer-dark";
      };
    };
  };
}
