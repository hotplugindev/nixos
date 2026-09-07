{
  lib,
  config,
  pkgs,
  ...
}:
let
  ruby = config.gb.home.dev.languages.ruby;
in
{
  options = {
    gb.home.dev.languages.ruby.enable = lib.mkEnableOption "Enable Ruby development tools";
  };

  config = lib.mkIf ruby.enable {
    home.packages = [
      pkgs.ruby
    ];
  };
}
