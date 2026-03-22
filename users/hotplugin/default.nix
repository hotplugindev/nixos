{ hostType, username, ... }:
{
  imports = [ ../../modules/home/default.nix ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
