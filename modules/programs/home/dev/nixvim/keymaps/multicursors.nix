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
        mode = [
          "n"
          "v"
        ];
        key = "<leader>m";
        action = "<cmd>MCstart<CR>";
        options.desc = "Start multicursor";
      }
    ];
  };
}
