{ lib, config, ... }:
let
  udisks2 = config.gb.system.services.udisks2;
in
{
  options = {
    gb.system.services.udisks2.enable = lib.mkEnableOption "Enable udisks2";
  };

  config = {
    services.udisks2.enable = lib.mkIf udisks2.enable true;
  };
}
