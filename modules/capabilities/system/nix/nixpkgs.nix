{ lib, config, ... }:
let
  nixpkgsCfg = config.gb.nix.nixpkgs;
in
{
  options.gb.nix.nixpkgs.allowunfree = lib.mkEnableOption "Allow unfree nixpkgs";

  config = {
    nixpkgs.config.allowUnfree = lib.mkIf nixpkgsCfg.allowunfree true;
  };
}
