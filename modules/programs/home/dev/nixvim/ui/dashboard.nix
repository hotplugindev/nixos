{
  lib,
  config,
  ...
}:
let
  dashboard = config.gb.home.dev.nixvim.ui.dashboard;
in
{
  options = {
    gb.home.dev.nixvim.ui.dashboard.enable = lib.mkEnableOption "Enable nixvim dashboard";
  };

  config = lib.mkIf dashboard.enable {
    programs.nixvim.plugins.alpha = {
      enable = true;
      theme = "dashboard";
    };
  };
}