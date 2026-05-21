{
  inputs,
  lib,
  config,
  ...
}:
let
  nixvim = config.gb.home.dev.nixvim;
in
{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./core/default.nix
    ./keymaps/default.nix
    ./ui/default.nix
    ./editor/default.nix
    ./navigation/default.nix
    ./coding/default.nix
    ./tools/default.nix
  ];

  options = {
    gb.home.dev.nixvim = {
      enable = lib.mkEnableOption "Enable nixvim in home-manager";
      defaultEditor = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Set nixvim as default editor";
      };
    };
  };

  config = {
    gb.home.dev.nixvim.enable = lib.mkDefault true;
    gb.home.dev.nixvim.defaultEditor = lib.mkDefault true;
  }
  // lib.mkIf nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = nixvim.defaultEditor;

      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };
    };
  };
}
