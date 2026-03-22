{ pkgs, ... }:
{
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
