{
  lib,
  config,
  pkgs,
  ...
}:
let
  python = config.gb.home.dev.languages.python;
in
{
  options = {
    gb.home.dev.languages.python = {
      enable = lib.mkEnableOption "Enable Python development tools";

      libraries = lib.mkOption {
        type = lib.types.functionTo (lib.types.listOf lib.types.package);
        default = ps: [ ];
        description = "Function selecting Python libraries from the Python package set";
      };
    };
  };

  config = lib.mkIf python.enable {
    home.packages = [
      (pkgs.python3.withPackages python.libraries)
    ];
  };
}
