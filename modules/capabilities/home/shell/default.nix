{ lib, config, ... }:
let
  requested = config.gb.requires.home.shell != [ ];
  hostName = config.gb.host.name;
in
{
  config = lib.mkIf requested {
    programs.zsh = {
      enable = true;
      dotDir = config.home.homeDirectory;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -lah";
        rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#${hostName}";
        test = "sudo nixos-rebuild test --flake /etc/nixos#${hostName}";
        update-flake = "cd /etc/nixos && nix flake update";
      };
      initContent = ''
        export EDITOR=nvim
        bindkey -e
      '';
    };
  };
}
