{ hostname, ... }:
{
  imports = [
    ./ai/default.nix
    ./communication/default.nix
    ./editors/default.nix
    ./gaming/default.nix
    ./multimedia/default.nix
    ./productivity/default.nix
    ./remote/default.nix
    ./web/default.nix
  ];

}
