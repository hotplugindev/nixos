{
  lib,
  config,
  ...
}:
let
  multicursors = config.gb.home.dev.nixvim.keymaps.multicursors;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.multicursors.enable =
      lib.mkEnableOption "Enable nixvim multicursors keymaps";
  };

  config = lib.mkIf multicursors.enable {
    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "<C-d>";
        action.__raw = "function() require('multicursors').new_under_cursor() end";
        options.desc = "Multicursor: select next occurrence";
      }

      {
        mode = "v";
        key = "<C-d>";
        action.__raw = "function() require('multicursors').new_pattern_visual() end";
        options.desc = "Multicursor: select visual selection";
      }

      {
        mode = "n";
        key = "<Esc>";
        action.__raw = "function() require('multicursors').exit() end";
        options.desc = "Multicursor: exit";
      }
    ];
  };
}
