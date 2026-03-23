{ ... }:
{
  programs.nixvim.keymaps = [
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
      options.desc = "Diff this";
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
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
      options.desc = "Git status";
    }
  ];
}
