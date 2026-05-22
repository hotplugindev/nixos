{
  lib,
  config,
  ...
}:
let
  terminal = config.gb.home.dev.nixvim.keymaps.terminal;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.terminal.enable = lib.mkEnableOption "Enable nixvim terminal keymaps";
  };

  config = lib.mkIf terminal.enable {
    programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm direction=float<CR>";
      options.desc = "Float terminal";
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm size=10 direction=horizontal<CR>";
      options.desc = "Horizontal terminal";
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm size=80 direction=vertical<CR>";
      options.desc = "Vertical terminal";
    }
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    ];
  };
}
