{
  lib,
  config,
  pkgs,
  ...
}:
let
  elixir = config.gb.home.dev.languages.elixir;
in
{
  options = {
    gb.home.dev.languages.elixir.enable = lib.mkEnableOption "Enable Elixir development tools";
  };

  config = lib.mkIf elixir.enable {
    home.packages = [
      pkgs.elixir
    ];
  };
}
