{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./storage.nix
  ];

  gb.programs.system.steam.enable = true;

  gb.requires.system.graphics.intel = [ "hosts.laptop" ];
  gb.requires.system.hardware.arduino = [ "hosts.laptop" ];

  gb.system.scripts.turbo-toggle.enable = true;

  gb.capabilities.system.desktop.greetd = {
    greeter = "noctalia";
    noctalia.settings = {
      appearance = {
        theme_mode = "dark";
        scheme = "Kanagawa";
        font_family = "JetBrainsMono Nerd Font";
        corner_radius_scale = 1.0;
      };
      clock.time_format = "{:%H:%M}";
    };
  };
}
