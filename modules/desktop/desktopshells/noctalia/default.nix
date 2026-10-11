{ lib, pkgs, ... }:
{
  imports = [
    ./options/default.nix
    ./program/default.nix
    ./services.nix
    ./wallpaper.nix
    ./location.nix
    ./compositors/mango.nix
  ];

  options.gb.home.desktopshells.noctalia = {
    enable = lib.mkEnableOption "Enable Noctalia desktop shell";

    package = lib.mkPackageOption pkgs "noctalia" { };

    settings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Raw TOML attrset merged on top of typed config and built-in defaults. Escape hatch for arbitrary-keyed tables (bar instances, widget definitions, launcher providers, custom palette/label maps) and for any key not covered by the typed layer.";
    };
  };
}
