{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -lah";
      rebuild-pc = "sudo nixos-rebuild switch --flake /etc/nixos#pc";
      rebuild-laptop = "sudo nixos-rebuild switch --flake /etc/nixos#laptop";
      test-pc = "sudo nixos-rebuild test --flake /etc/nixos#pc";
      test-laptop = "sudo nixos-rebuild test --flake /etc/nixos#laptop";
      update-flake = "cd /etc/nixos && nix flake update";
    };
    initContent = ''
      export EDITOR=nvim
    '';
  };
}
