{
  lib,
  config,
  pkgs,
  ...
}:
let
  nix-ld = config.gb.programs.nix-ld;
in
{
  options = {
    gb.programs.nix-ld.enable = lib.mkEnableOption "Enable nix-ld";
    gb.programs.nix-ld.libraries = lib.mkOption {
      type = lib.types.listOf lib.types.pkgs;
      default = [ ];
      description = "The list of libraries for nix-ld";
    };
  };
  config = {
    programs.nix-ld.enable = lib.mkIf nix-ld.enable true;
    programs.nix-ld.libraries = lib.mkIf nix-ld.enable (with pkgs; nix-ld.libraries);
  };
}
