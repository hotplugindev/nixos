{
  lib,
  config,
  ...
}:
let
  git = config.gb.home.dev.nixvim.keymaps.git;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.git.enable = lib.mkEnableOption "Enable nixvim git keymaps";
  };

  config = lib.mkIf git.enable {
    programs.nixvim.keymaps = [
      # Gitsigns hunk navigation & actions
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Gitsigns blame_line<CR>";
        options.desc = "Blame line";
      }
      {
        mode = "n";
        key = "<leader>gd";
        action = "<cmd>Gitsigns diffthis<CR>";
        options.desc = "Diff this (file)";
      }
      {
        mode = "n";
        key = "<leader>gj";
        action = "<cmd>Gitsigns next_hunk<CR>";
        options.desc = "Next hunk";
      }
      {
        mode = "n";
        key = "<leader>gk";
        action = "<cmd>Gitsigns prev_hunk<CR>";
        options.desc = "Previous hunk";
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options.desc = "Preview hunk";
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = "<cmd>Gitsigns reset_hunk<CR>";
        options.desc = "Reset hunk";
      }

      # Neogit Integration (Replaces Fugitive)
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Neogit<CR>";
        options.desc = "Neogit status";
      }

      # Diffview Integration
      {
        mode = "n";
        key = "<leader>gD";
        action = "<cmd>DiffviewOpen<CR>";
        options.desc = "Diffview open";
      }
      {
        mode = "n";
        key = "<leader>gh";
        action = "<cmd>DiffviewFileHistory<CR>";
        options.desc = "Diffview file history";
      }
    ];
  };
}
