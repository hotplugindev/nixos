{
  lib,
  config,
  ...
}:
let
  zellij = config.gb.home.dev.tooling.zellij;
in
{
  options = {
    gb.home.dev.tooling.zellij.enable = lib.mkEnableOption "Enable zellij in the home dir";
  };

  config = lib.mkIf zellij.enable {
    gb.requires.home.zellij = [ "programs.home.dev.tooling.zellij" ];
  };
}
