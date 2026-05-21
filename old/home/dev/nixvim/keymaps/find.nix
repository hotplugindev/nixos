{
  lib,
  config,
  ...
}:
let
  find = config.gb.home.dev.nixvim.keymaps.find;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.find.enable = lib.mkEnableOption "Enable nixvim find keymaps";
  };

  config = lib.mkIf find.enable {
    programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fa";
      action = "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>";
      options.desc = "Find all files";
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "Live grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options.desc = "Help tags";
    }
    {
      mode = "n";
      key = "<leader>fo";
      action = "<cmd>Telescope oldfiles<CR>";
      options.desc = "Recent files";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<CR>";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope commands<CR>";
      options.desc = "Commands";
    }
    ];
  };
}
