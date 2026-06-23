{
  lib,
  config,
  pkgs,
  ...
}:
let
  enabled = config.gb.host.shell == "zsh";
in
{
  config = lib.mkIf enabled {
    programs.zsh.enable = true;
    users.users.${config.gb.user.username}.shell = pkgs.zsh;
  };
}
