{ pkgs, hostType, ... }:
{
  imports = [

  ]
  ++ (if hostType == "laptop" then [ ./laptop.nix ] else [ ./pc.nix ]);

  home.packages = with pkgs; [
    gcc
    go
    nodejs
    zig
    cargo
    rustc
    python3
  ];
}
