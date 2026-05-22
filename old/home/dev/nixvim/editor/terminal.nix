{
  lib,
  config,
  ...
}:
let
  terminal = config.gb.home.dev.nixvim.editor.terminal;
in
{
  options = {
    gb.home.dev.nixvim.editor.terminal.enable = lib.mkEnableOption "Enable nixvim terminal integration";
  };

  config = lib.mkIf terminal.enable {
    programs.nixvim.plugins.toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts.border = "curved";
        insert_mappings = true;
        terminal_mappings = true;
      };
    };
  };
}