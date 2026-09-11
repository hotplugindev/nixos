{
  lib,
  config,
  pkgs,
  ...
}:
let
  gh-nvim = config.gb.home.dev.nixvim.tools.gh-nvim;
in
{
  options = {
    gb.home.dev.nixvim.tools.gh-nvim.enable =
      lib.mkEnableOption "Enable nixvim gh.nvim for GitHub PR and issue workflow";
  };

  config = lib.mkIf gh-nvim.enable {
    programs.nixvim = {
      extraPlugins = [
        {
          plugin = pkgs.vimPlugins.gh-nvim;
          config = "";
        }
      ];
      extraPackages = [ pkgs.gh ];
    };
  };
}
