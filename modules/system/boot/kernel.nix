{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    gb.system.boot.kernel = lib.mkOption {
      type = lib.types.pkgs;
      default = pkgs.linuxPackages_zen;
      description = "Sets the kernel to be used by the system";
    };
  };

  config = {
    environment.gb.systemPackages = config.system.boot.kernel;
  };
}
