{ config, ... }:
let
  hostname = config.networking.hostName or "pc";
in
{
  imports = [
    ../../features/user-environment/default.nix
    ../../features/user-environment/hosts/${hostname}/default.nix
  ];
}
