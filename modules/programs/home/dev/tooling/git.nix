{
  lib,
  config,
  ...
}:
let
  git = config.gb.home.dev.tooling.git;
in
{
  options = {
    gb.home.dev.tooling.git.enable = lib.mkEnableOption "Enable git in the home dir";
  };

  config = lib.mkIf git.enable {
    gb.requires.home.git = [ "programs.home.dev.tooling.git" ];
  };
}
