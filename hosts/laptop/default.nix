{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./storage.nix
  ];

  gb.requires.system.graphics.intel = [ "hosts.laptop" ];
  gb.requires.system.hardware.arduino = [ "hosts.laptop" ];

  gb.system.scripts.turbo-toggle.enable = true;

  gb.capabilities.system.desktop.greetd.greeter = "dms";
}
