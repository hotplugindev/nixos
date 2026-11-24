{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.boot.plymouth != [ ];
in
{
  config = lib.mkIf requested {
    boot = {
      plymouth = {
        enable = true;
        theme = lib.mkDefault "black_hud";
        themePackages = [
          (pkgs.adi1090x-plymouth-themes.override {
            selected_themes = [ "black_hud" ];
          })
        ];
      };

      consoleLogLevel = lib.mkDefault 0;
      initrd.verbose = lib.mkDefault false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_level=3"
        "rd.systemd.show_status=false"
      ];
    };
  };
}
