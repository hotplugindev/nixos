{
  lib,
  config,
  ...
}:
let
  linting = config.gb.home.dev.nixvim.coding.linting;
in
{
  options = {
    gb.home.dev.nixvim.coding.linting.enable = lib.mkEnableOption "Enable nixvim linting";
  };

  config = lib.mkIf linting.enable {
    programs.nixvim.plugins = {
      none-ls = {
        enable = true;
        enableLspFormat = false;
      };
    };
  };
}