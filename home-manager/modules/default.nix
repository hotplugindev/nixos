{ ... }:
{
  imports = [
    ./shared/core/git.nix
    ./shared/core/shell.nix
    ./shared/theme/stylix.nix
    ./shared/nixvim/base.nix
    ./shared/desktop/base.nix
    ./shared/programs/base.nix
    ./shared/dev/base.nix
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  home.packages = [
  ];
}
