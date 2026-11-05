{
  lib,
  config,
  pkgs,
  ...
}:
let
  systemverilog = config.gb.home.dev.languages.systemverilog;
in
{
  options = {
    gb.home.dev.languages.systemverilog.enable =
      lib.mkEnableOption "Enable SystemVerilog development tools";
  };

  config = lib.mkIf systemverilog.enable {
    home.packages = [
      pkgs.iverilog
      pkgs.yosys
      pkgs.graphviz
    ];
  };
}
