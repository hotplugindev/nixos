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
        key = "<leader>gd";
        action = "<cmd>Gitsigns diffthis<CR>";
        options.desc = "Diff this file";
      }
      {
        mode = "n";
        key = "<leader>gS";
        action = "<cmd>Gitsigns stage_hunk<CR>";
        options.desc = "Stage hunk";
      }
      {
        mode = "v";
        key = "<leader>gS";
        action = ":Gitsigns stage_hunk<CR>";
        options.desc = "Stage hunk (visual)";
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Gitsigns stage_buffer<CR>";
        options.desc = "Stage buffer";
      }
      {
        mode = "n";
        key = "<leader>gu";
        action = "<cmd>Gitsigns undo_stage_hunk<CR>";
        options.desc = "Undo stage hunk";
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = "<cmd>Gitsigns reset_hunk<CR>";
        options.desc = "Reset hunk";
      }
      {
        mode = "v";
        key = "<leader>gr";
        action = ":Gitsigns reset_hunk<CR>";
        options.desc = "Reset hunk (visual)";
      }
      {
        mode = "n";
        key = "<leader>gR";
        action = "<cmd>Gitsigns reset_buffer<CR>";
        options.desc = "Reset buffer";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Gitsigns blame_line<CR>";
        options.desc = "Blame line";
      }
      {
        mode = "n";
        key = "<leader>gB";
        action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
        options.desc = "Toggle inline blame";
      }
      {
        mode = "n";
        key = "<leader>gw";
        action = "<cmd>Gitsigns toggle_word_diff<CR>";
        options.desc = "Toggle word diff";
      }

      {
        mode = "n";
        key = "<leader>gn";
        action = "<cmd>Neogit<CR>";
        options.desc = "Neogit status";
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = "<cmd>Neogit commit<CR>";
        options.desc = "Neogit commit";
      }
      {
        mode = "n";
        key = "<leader>gD";
        action = "<cmd>DiffviewOpen<CR>";
        options.desc = "Diffview open";
      }
      {
        mode = "n";
        key = "<leader>gC";
        action = "<cmd>DiffviewClose<CR>";
        options.desc = "Diffview close";
      }
      {
        mode = "n";
        key = "<leader>gh";
        action = "<cmd>DiffviewFileHistory<CR>";
        options.desc = "Diffview file history";
      }
      {
        mode = "n";
        key = "<leader>gF";
        action = {
          __raw = ''
            function()
              local base = vim.fn.input("Base branch: ", "main")
              if base == "" then return end
              local target = vim.fn.input("Target branch: ", "HEAD")
              if target == "" then return end
              vim.cmd("DiffviewOpen " .. base .. ".." .. target)
            end
          '';
        };
        options.desc = "Compare branches";
      }
    ];
  };
}
