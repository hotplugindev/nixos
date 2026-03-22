{ hostType, username, ... }:
{
  imports = [
    ../../modules/default.nix
  ] ++ (if hostType == "laptop" then [ ./hosts/laptop.nix ] else [ ./hosts/pc.nix ]);

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
