{
  config,
  lib,
  username,
  ...
}:
let
  waydroid = config.gb.system.virtualization.waydroid;
in
{
  options = {
    gb.system.virtualization.waydroid.enable = lib.mkEnableOption "Enable docker for the system";
  };

  config = lib.mkIf waydroid.enable {
    virtualisation.waydroid.enable = true;
  };
}
