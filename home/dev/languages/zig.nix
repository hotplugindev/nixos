{
  lib,
  config,
  pkgs,
  ...
}:
let
  zig = config.gb.home.dev.languages.zig;
in
{
  options = {
    gb.home.dev.languages.zig.enable = lib.mkEnableOption "Enable Zig language tools";
  };

  config = lib.mkIf zig.enable {
    home.packages = [
      pkgs.zig
    ];
  };
}
