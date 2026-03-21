{ pkgs, fullName, username, ... }:
{
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  users.users.${username} = {
    isNormalUser = true;
    description = fullName;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.printing.enable = false;
  services.openssh.enable = false;

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    btop
    killall
  ];

  system.stateVersion = "25.11";
}
