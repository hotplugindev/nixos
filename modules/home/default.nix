{
  lib,
  hostType,
  ...
}:
{
  imports = [
    ./core/git.nix
    ./core/shell.nix
    ./features/nixvim/base.nix
    ./features/desktop/base.nix
    ./features/programs/base.nix
    ./features/dev/base.nix
  ]
  ++ lib.optionals (hostType == "desktop") [ ./hosts/pc.nix ]
  ++ lib.optionals (hostType == "laptop") [ ./hosts/laptop.nix ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  home.packages = [
  ];
}
