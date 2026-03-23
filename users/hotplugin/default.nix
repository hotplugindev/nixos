{ hostname, username, ... }:
{
  imports = [
    ../../home-manager/modules/default.nix
    ../../home-manager/modules/hosts/${hostname}/default.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
