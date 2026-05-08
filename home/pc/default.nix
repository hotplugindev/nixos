{ lib, pkgs, ... }:
{
  imports = [
  ];

  gb.home.programs.gaming.steampack.enable = true;
  gb.home.programs.gaming.bottles.enable = true;
  gb.home.programs.gaming.boxflat.enable = true;
  gb.home.programs.gaming.ckan.enable = true;

  gb.home.dev.languages.php.enable = true;

  gb.home.desktop.mango.mangowc.monitors = [
    "name:DP-2,width:1920,height:1080,refresh:240,x:1920,y:0,scale:1"
    "name:HDMI-A-1,width:1920,height:1080,refresh:60,x:0,y:0,scale:1"
  ];
}
