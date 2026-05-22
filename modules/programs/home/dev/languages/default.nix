{ lib, ... }:
{
  imports = [
    ./dotnet.nix
    ./node.nix
    ./c.nix
    ./go.nix
    ./rust.nix
    ./zig.nix
    ./python.nix
    ./php.nix
    ./flutter.nix
  ];

  gb.home.dev.languages.node.enable = lib.mkDefault false;
  gb.home.dev.languages.c.enable = lib.mkDefault false;
  gb.home.dev.languages.rust.enable = lib.mkDefault false;
  gb.home.dev.languages.python.enable = lib.mkDefault false;

  gb.home.dev.languages.dotnet.enable = lib.mkDefault false;
  gb.home.dev.languages.flutter.enable = lib.mkDefault false;
  gb.home.dev.languages.php.enable = lib.mkDefault false;
  gb.home.dev.languages.zig.enable = lib.mkDefault false;
  gb.home.dev.languages.go.enable = lib.mkDefault false;
}
