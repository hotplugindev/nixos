{ lib, ... }:
{
  imports = [
    ./vscode.nix
    ./zed.nix
    ./android-studio.nix
    ./antigravity.nix
  ];

  gb.home.dev.editors.vscode.enable = lib.mkDefault true;
  gb.home.dev.editors.zed.enable = lib.mkDefault true;

  gb.home.dev.editors.android-studio.enable = lib.mkDefault false;
  gb.home.dev.editors.antigravity.enable = lib.mkDefault false;
}
