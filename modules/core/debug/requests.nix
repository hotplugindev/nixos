{ lib, ... }:
{
  options.gb.debug.requests.enable = lib.mkEnableOption "Enable request debugging";
}
