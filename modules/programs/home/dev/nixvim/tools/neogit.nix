{
  lib,
  config,
  ...
}:
let
  neogit = config.gb.home.dev.nixvim.tools.neogit;
in
{
  options = {
    gb.home.dev.nixvim.tools.neogit.enable =
      lib.mkEnableOption "Enable nixvim neogit for interactive git workflows";
  };

  config = lib.mkIf neogit.enable {
    programs.nixvim.plugins.neogit = {
      enable = true;
      settings = {
        integrations = {
          diffview = true;
        };
      };
    };
  };
}
