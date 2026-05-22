{
  lib,
  config,
  pkgs,
  ...
}:
let
  rust = config.gb.home.dev.languages.rust;
in
{
  options = {
    gb.home.dev.languages.rust.enable = lib.mkEnableOption "Enable Rust development tools";
  };

  config = lib.mkIf rust.enable {
    home.packages = [
      pkgs.cargo
      pkgs.rustc
    ];
  };
}
