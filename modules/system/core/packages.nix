{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    btop
    killall
    dnsmasq
  ];

  system.stateVersion = "25.11";
}
