{ lib, config, ... }:
let
  nixpkgs = config.gb.nix.nixpkgs;
in
{
  options = {
    gb.nix.nixpkgs.allowunfree = lib.mkEnableOption "Allow unfree nixpkgs";
  };

  config = {
    nixpkgs.config.allowUnfree = lib.mkIf nixpkgs.allowunfree true;
  };
}
