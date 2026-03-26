{
  lib,
  config,
  ...
}:
let
  treesitter = config.gb.home.dev.nixvim.editor.treesitter;
in
{
  options = {
    gb.home.dev.nixvim.editor.treesitter.enable = lib.mkEnableOption "Enable nixvim treesitter";
  };

  config = lib.mkIf treesitter.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            scope_incremental = false;
            node_decremental = "<bs>";
          };
        };
      };
    };
  };
}