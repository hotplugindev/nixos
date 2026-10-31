{ lib, config, ... }:
let
  warp = config.gb.programs.system.warp;
in
{
  options.gb.programs.system.warp.enable = lib.mkEnableOption "Install Cloudflare Warp";

  config = lib.mkIf warp.enable {
    services.cloudflare-warp.enable = true;
  };
}
