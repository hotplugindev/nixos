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
        action = "<cmd>MCstart<cr>";
        options.desc = "Create a selection for word under cursor or selected text";
      }

      # Prompt for a pattern and select every match in the buffer (Normal mode)
      {
        mode = "n";
        key = "<leader>mp";
        action = "<cmd>MCpattern<cr>";
        options.desc = "Select all matches for a pattern (Buffer)";
      }

      # Prompt for a pattern and select every match in the visual selection (Visual mode)
      {
        mode = "v";
        key = "<leader>mp";
        action = "<cmd>MCvisualPattern<cr>";
        options.desc = "Select all matches for a pattern (Visual)";
      }

      # Select the exact character under the cursor
      {
        mode = "n";
        key = "<leader>mu";
        action = "<cmd>MCunderCursor<cr>";
        options.desc = "Create a selection for char under cursor";
      }

      # Clear all selections
      {
        mode = [
          "n"
          "v"
        ];
        key = "<esc>";
        action = "<cmd>MCclear<cr>";
        options.desc = "Clear all multicursor selections";
      }
    ];
  };
}
