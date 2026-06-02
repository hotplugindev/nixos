{ lib, config, ... }:
{
  imports = [
    ../core/host/options.nix
    ../core/user/options.nix
    ../core/requests/home.nix
    ../core/debug/requests.nix

    ../profiles/home/desktop.nix
    ../profiles/home/development.nix
    ../profiles/home/gaming.nix

    ../capabilities/home/git/default.nix
    ../capabilities/home/shell/default.nix
    ../capabilities/home/terminal/foot.nix
    ../capabilities/home/theme/default.nix
    ../capabilities/home/xdg/default.nix

    ../programs/home/default.nix
    ../programs/home/dev/default.nix
    ../programs/home/tools/default.nix

    ../desktop/mango/home/default.nix
  ];

  config = {
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}
