{ ... }:
{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts.border = "curved";
      insert_mappings = true;
      terminal_mappings = true;
    };
  };
}