{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.shell.zsh != [ ];
in
{
  config = lib.mkIf requested {
    programs.zsh.enable = true;
    users.users.${config.gb.user.username}.shell = pkgs.zsh;
  };
}
