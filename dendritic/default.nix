{ hostname, ... }:
{
  imports = [
    ./features/system/core.nix
    ./features/system/profile.nix
    ./features/home/modules.nix
    ./features/home/stylix.nix
  ];

  networking.hostName = hostname;
}
