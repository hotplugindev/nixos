{
  lib,
  config,
  ...
}:
let
  shell = config.gb.home.dev.tooling.shell;
in
{
  options = {
    gb.home.dev.tooling.shell.enable = lib.mkEnableOption "Enable git in the home dir";
  };

  config = lib.mkIf shell.enable {
    gb.requires.home.shell = [ "programs.home.dev.tooling.shell" ];
  };
}
