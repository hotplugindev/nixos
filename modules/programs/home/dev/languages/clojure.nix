{
  lib,
  config,
  pkgs,
  ...
}:
let
  clojure = config.gb.home.dev.languages.clojure;
in
{
  options = {
    gb.home.dev.languages.clojure.enable = lib.mkEnableOption "Enable Clojure development tools";
  };

  config = lib.mkIf clojure.enable {
    home.packages = [
      pkgs.clojure
    ];
  };
}
