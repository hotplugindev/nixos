{ ... }:
{
  imports = [
    ./git.nix
    ./shell.nix
    ./nixvim.nix
    ./desktop/base.nix
    ./programs/base.nix
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  home.packages = [
  ];
}
