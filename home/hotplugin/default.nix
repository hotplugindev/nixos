{ hostType, username, ... }:
{
  imports = [
    ../../modules/home/base.nix
  ] ++ (if hostType == "laptop" then [ ./laptop.nix ] else [ ./pc.nix ]);

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
