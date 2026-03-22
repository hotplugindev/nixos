{ ... }:
{
  imports = [
    ./git.nix
    ./shell.nix
    ./nixvim/base.nix
    ./desktop/base.nix
    ./programs/base.nix
    ./dev/base.nix
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  home.packages = [
  ];
}
