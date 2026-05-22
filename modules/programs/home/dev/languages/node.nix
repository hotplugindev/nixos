{
  lib,
  config,
  pkgs,
  ...
}:
let
  node = config.gb.home.dev.languages.node;
in
{
  options = {
    gb.home.dev.languages.node.enable = lib.mkEnableOption "Enable Node.js language tooling";
  };

  config = lib.mkIf node.enable {
    home.packages = [
      pkgs.nodejs
    ];
  };
}
