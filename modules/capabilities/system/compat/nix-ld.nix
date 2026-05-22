{ lib, config, ... }:
let
  requested = config.gb.requires.system.compat.nixLd != [ ];
  libraries = config.gb.system.compat.nixLd.libraries;
in
{
  options.gb.system.compat.nixLd.libraries = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
    description = "Extra libraries for nix-ld";
  };

  config = lib.mkIf requested {
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = libraries;
  };
}
