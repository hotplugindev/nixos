{ lib, config, ... }:
let
  requested = config.gb.requires.system.boot.plymouth != [ ];
in
{
  config = lib.mkIf requested {
    boot = {
      plymouth = {
        enable = true;
        theme = lib.mkDefault "spinner";
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
