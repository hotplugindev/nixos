{ hostname, ... }:
{
  imports = [
    ./desktop/default.nix
    ./programs/default.nix

    ./dev/default.nix

    ./${hostname}/default.nix
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
