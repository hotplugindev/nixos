{
  lib,
  config,
  ...
}:
let
  gitsigns = config.gb.home.dev.nixvim.tools.gitsigns;
in
{
  options = {
    gb.home.dev.nixvim.tools.gitsigns.enable =
      lib.mkEnableOption "Enable nixvim gitsigns for fast git feedback in file";
  };

  config = lib.mkIf gitsigns.enable {
    programs.nixvim.plugins.gitsigns = {
      enable = true;
      settings = {
        signcolumn = true;
        numhl = true;
        linehl = false;
        word_diff = false;
        current_line_blame = false;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
          delay = 500;
          ignore_whitespace = false;
        };
        signs = {
          add = { text = "│"; };
          change = { text = "│"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "~"; };
          untracked = { text = "┆"; };
        };
        on_attach.__raw = ''
          function(bufnr)
            local gs = package.loaded.gitsigns
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gB', ':Gitsigns blame<CR>', { desc = 'Blame (full)' })
          end
        '';
      };
    };
  };
}
