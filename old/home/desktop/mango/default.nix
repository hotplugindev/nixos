{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
in
{
  imports = [
    ./core/default.nix
    ./mangowc/default.nix
    ./dms/default.nix
    ./services/default.nix
  ];

  options.gb.home.desktop.mango = {
    enable = lib.mkEnableOption "Enable Mango desktop domain";
    services.enable = lib.mkEnableOption "Enable Mango session services";
    mangowc.enable = lib.mkEnableOption "Enable MangoWC compositor stack";
    dms.enable = lib.mkEnableOption "Enable DankMaterialShell stack";
    legacy.enable = lib.mkEnableOption "Enable archived old Mango stack";
  };

  config = {
    assertions = [
      {
        assertion = !mango.legacy.enable;
        message = "`gb.home.desktop.mango.legacy.enable` is archived. Old setup is under `home/desktop/mango/old`.";
      }
    ];

    gb.home.desktop.mango.enable = lib.mkDefault true;
    gb.home.desktop.mango.services.enable = lib.mkDefault mango.enable;
    gb.home.desktop.mango.mangowc.enable = lib.mkDefault mango.enable;
    gb.home.desktop.mango.dms.enable = lib.mkDefault mango.enable;
    gb.home.desktop.mango.legacy.enable = lib.mkDefault false;
  };
}
