{ ... }:
{
  imports = [
    ./core/git.nix
    ./core/shell.nix
    ./features/nixvim/default.nix
    ./features/desktop/default.nix
    ./features/apps/default.nix
    ./features/dev/default.nix
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  home.packages = [
  ];
}
