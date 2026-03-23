{ username, ... }:
{
  home-manager.users.${username}.imports = [
    ../../../modules/home/default.nix
  ];
}
