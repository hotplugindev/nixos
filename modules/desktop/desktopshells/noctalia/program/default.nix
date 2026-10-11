{
  lib,
  config,
  pkgs,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  baseline = import ../baseline.nix;
  tomlFormat = pkgs.formats.toml { };

  typedNonNull = lib.filterAttrsRecursive (_: v: v != null) noctalia.config;
  merged = lib.recursiveUpdate (lib.recursiveUpdate baseline typedNonNull) noctalia.settings;
  configFile = tomlFormat.generate "noctalia-config.toml" merged;
in
{
  config = lib.mkIf noctalia.enable {
    home.packages = [ noctalia.package ];

    xdg.configFile."noctalia/config.toml" = {
      source = configFile;
    };
  };
}
