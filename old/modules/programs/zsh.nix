{
  lib,
  config,
  pkgs,
  username,
  ...
}:
let
  zsh = config.gb.programs.zsh;
in
{
  options = {
    gb.programs.zsh.enable = lib.mkEnableOption "Install ZSH";
    gb.programs.zsh.user-shell = lib.mkEnableOption "Set zsh as user shell";
  };
  config = {
    programs.zsh.enable = lib.mkIf zsh.enable true;
    users.users.${username}.shell = pkgs.zsh;
  };
}
