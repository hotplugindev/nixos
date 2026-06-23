{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.dms-plugin-registry.homeModules.default

    ../core/host/options.nix
    ../core/user/options.nix
    ../core/requests/home.nix
    ../core/debug/requests.nix

    ../profiles/home/desktop.nix
    ../profiles/home/development.nix
    ../profiles/home/gaming.nix
    ../profiles/home/workstation.nix

    ../capabilities/home/git/default.nix
    ../capabilities/home/shell/default.nix
    ../capabilities/home/terminal/foot.nix
    ../capabilities/home/theme/default.nix
    ../capabilities/home/xdg/default.nix
    ../capabilities/home/networking/kdeconnect.nix

    ../capabilities/home/desktop/session-target.nix
    ../capabilities/home/desktop/auth-agent.nix
    ../capabilities/home/desktop/dbus-env.nix
    ../capabilities/home/desktop/cliphist.nix
    ../capabilities/home/desktop/nextcloud.nix

    ../programs/home/default.nix
    ../programs/home/dev/default.nix
    ../programs/home/tools/default.nix

    ../desktop/mango/home/default.nix
    ../desktop/quickshell/home/default.nix
  ];

  config = {
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}
