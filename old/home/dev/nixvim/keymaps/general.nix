{
  lib,
  config,
  ...
}:
let
  general = config.gb.home.dev.nixvim.keymaps.general;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.general.enable = lib.mkEnableOption "Enable nixvim general keymaps";
  };

  config = lib.mkIf general.enable {
    programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Clear highlights";
    }
    {
      mode = "n";
      key = "<leader>ww";
      action = "<cmd>w<CR>";
      options.desc = "Save file";
    }
    {
      mode = "n";
      key = "<leader>wa";
      action = "<cmd>wa<CR>";
      options.desc = "Save all";
    }
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>q<CR>";
      options.desc = "Quit";
    }
    {
      mode = "n";
      key = "<leader>qa";
      action = "<cmd>qa<CR>";
      options.desc = "Quit all";
    }
    {
      mode = "n";
      key = "<leader>nh";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "No highlight";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle filesystem reveal left<CR>";
      options.desc = "Explorer";
    }
    ];
  };
}
