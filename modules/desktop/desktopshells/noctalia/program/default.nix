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

  unwrapOverrides =
    val:
    if builtins.isAttrs val then
      if val ? _type && val._type == "override" && val ? content then
        unwrapOverrides val.content
      else
        lib.mapAttrs (_: v: unwrapOverrides v) val
    else if builtins.isList val then
      map unwrapOverrides val
    else
      val;

  typedNonNull = lib.filterAttrsRecursive (_: v: v != null) noctalia.config;
  cleanSettings = unwrapOverrides noctalia.settings;
  merged = lib.recursiveUpdate (lib.recursiveUpdate baseline typedNonNull) cleanSettings;
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
