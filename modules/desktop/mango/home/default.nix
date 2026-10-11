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
  ];

  options.gb.home.desktop.mango = {
    enable = lib.mkEnableOption "Enable Mango desktop domain";
    mangowc.enable = lib.mkEnableOption "Enable MangoWC compositor stack";
    legacy.enable = lib.mkEnableOption "Enable archived old Mango stack";
  };

  config = {
    assertions = [
      {
        assertion = !mango.legacy.enable;
        message = "`gb.home.desktop.mango.legacy.enable` is archived. Legacy setup is retained in the repository archive tree.";
      }
    ];

    gb.home.desktop.mango.mangowc.enable = lib.mkDefault mango.enable;
  };
}
