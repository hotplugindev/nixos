{ lib, config, ... }:
let
  mango = config.gb.home.desktop.mango;
  dmsEnabled = mango.services.enable && mango.dms.enable;
in
{
  imports = [
    ./dms/default.nix
    ./services/dms.nix
  ];

  config = {
    gb.home.desktop.mango.services.dms.enable = lib.mkDefault dmsEnabled;
  };
}
