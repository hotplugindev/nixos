{ lib, config, ... }:
let
  nixpkgsCfg = config.gb.nix.nixpkgs;
in
{
  options.gb.nix.nixpkgs.allowunfree = lib.mkEnableOption "Allow unfree nixpkgs";

  config = {
    nixpkgs.config.allowUnfree = lib.mkIf nixpkgsCfg.allowunfree true;
    nixpkgs.config.permittedInsecurePackages = [
      # bitwarden-desktop 2026.3.1 in nixos-26.05 still depends on Electron 39.
      "electron-39.8.10"
    ];
  };
}
