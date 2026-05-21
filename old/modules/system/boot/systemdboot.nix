{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.gb.system.boot.systemdboot;
in
{
  options = {
    gb.system.boot.systemdboot = {
      enable = lib.mkEnableOption "Enable systemdboot";
      secure = lib.mkEnableOption "Enable secure boot";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.systemd-boot.configurationLimit = 3;

    boot.loader.systemd-boot.enable = if cfg.secure then lib.mkForce false else true;

    boot.lanzaboote = lib.mkIf cfg.secure {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;
    };

    # Include sbctl tool automatically if secure boot is toggled
    environment.systemPackages = lib.optional cfg.secure pkgs.sbctl;
  };

}
