{ lib, config, ... }:
let
  noisetorch = config.gb.programs.system.noisetorch;
in
{
  options.gb.programs.system.noisetorch.enable = lib.mkEnableOption "Install Steam";

  config = lib.mkIf noisetorch.enable {
    programs.noisetorch.enable = true;
  };
}
