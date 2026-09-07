{
  lib,
  config,
  pkgs,
  ...
}:
let
  haskell = config.gb.home.dev.languages.haskell;
in
{
  options = {
    gb.home.dev.languages.haskell.enable = lib.mkEnableOption "Enable Haskell development tools";
  };

  config = lib.mkIf haskell.enable {
    home.packages = [
      pkgs.ghc
    ];
  };
}
