{
  lib,
  config,
  ...
}:
let
  notifications = config.gb.home.dev.nixvim.ui.notifications;
in
{
  options = {
    gb.home.dev.nixvim.ui.notifications.enable = lib.mkEnableOption "Enable nixvim notifications UI";
  };

  config = lib.mkIf notifications.enable {
    programs.nixvim.plugins = {
      noice.enable = true;
      notify.enable = true;
      dressing.enable = true;
    };
  };
}