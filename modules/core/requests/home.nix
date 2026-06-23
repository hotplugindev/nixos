{ lib, ... }:
let
  listOption =
    description:
    lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      inherit description;
    };
in
{
  options.gb.requires.home = {
    git = listOption "Request git configuration";
    shell = listOption "Request shell configuration";
    terminal = listOption "Request terminal configuration";
    theme = listOption "Request theme configuration";
    xdg = listOption "Request xdg configuration";

    desktop.mango = listOption "Request Mango home desktop";
    desktop.dms = listOption "Request DankMaterialShell";
    desktop.sessionTarget = listOption "Request Mango session target";
    desktop.authAgent = listOption "Request polkit auth agent";
    desktop.dbusEnv = listOption "Request dbus env import service";
    desktop.cliphist = listOption "Request clipboard history";
    desktop.nextcloud = listOption "Request Nextcloud session service";
    desktop.dmsPlugins.kdeconnect = listOption "Request DMS KDE Connect plugin";
  };
}
