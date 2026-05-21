{
  lib,
  config,
  pkgs,
  ...
}:
let
  base = config.gb.home.dev.tooling.base;
in
{
  options = {
    gb.home.dev.tooling.base = {
      enable = lib.mkEnableOption "Enable the base package tooling";
      pkgslist = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [
          pkgs.wget
          pkgs.btop
          pkgs.killall
        ];
        description = "List of packages to install as base tooling";
      };
    };
  };

  config = {
    home.packages = base.pkgslist;
  };
}
