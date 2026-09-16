{
  lib,
  config,
  pkgs,
  ...
}:
let
  logseq = config.gb.home.programs.productivity.logseq;
in
{
  options = {
    gb.home.programs.productivity.logseq.enable = lib.mkEnableOption "Enable logseq note keeper";
  };

  config = lib.mkIf logseq.enable {
    home.packages = [
      pkgs.logseq
    ];
  };
}
