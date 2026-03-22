{ hostType, username, ... }:
{
  imports = [
    ../../../modules/home/default.nix
  ] ++ (if hostType == "laptop" then [ ./hosts/config.laptop.nix ] else [ ./hosts/config.desktop.nix ]);

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
