{
  lib,
  config,
  ...
}:
let
  multicursors = config.gb.home.dev.nixvim.navigation.multicursors;
in
{
  options = {
    gb.home.dev.nixvim.navigation.multicursors.enable = lib.mkEnableOption "Enable nixvim multicursors";
  };

  config = lib.mkIf multicursors.enable {
    programs.nixvim.plugins.multicursors = {
      enable = true;
      autoLoad = false;

      settings = {
        DEBUG_MODE = false;
        create_commands = true;

        hint_config = {
          position = "top";
          type = "cmdline";
        };
      };
    };
  };
}
