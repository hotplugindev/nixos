{ lib, ... }:
{
  imports = [
    ./vscode.nix
    ./zed.nix
  ];

  gb.home.programs.editors.vscode.enable = lib.mkDefault true;
  gb.home.programs.editors.zed.enable = lib.mkDefault true;
}
