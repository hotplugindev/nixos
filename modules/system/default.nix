{ lib, ... }:
{
  imports = [
    ./users.nix
    ./boot/default.nix
    ./graphics/default.nix
    ./locales/default.nix
    ./scripts/default.nix
    ./security/default.nix
    ./services/default.nix
    ./virtualization/default.nix
  ];
}
