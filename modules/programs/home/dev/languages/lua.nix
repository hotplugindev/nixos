{
  lib,
  config,
  pkgs,
  ...
}:
let
  lua = config.gb.home.dev.languages.lua;
in
{
  options = {
    gb.home.dev.languages.lua.enable = lib.mkEnableOption "Enable Lua language tools";
  };

  config = lib.mkIf lua.enable {
    home.packages = [
      pkgs.lua
    ];
  };
}
