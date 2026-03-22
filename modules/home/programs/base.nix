{ hostType, ... }:
{
  imports = [
    ./webbrowsers.nix
    ./editors.nix
    ./communication.nix
    ./multimedia.nix
    ./entertainment.nix
  ]
  ++ (if hostType == "laptop" then [ ./laptop.nix ] else [ ./pc.nix ]);
}
