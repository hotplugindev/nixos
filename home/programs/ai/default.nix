{ lib, ... }:
{
  imports = [
    ./codex.nix
    ./claude-code.nix
    ./gemini-cli.nix
  ];

  gb.home.programs.ai.codex.enable = lib.mkDefault false;
  gb.home.programs.ai.claude-code.enable = lib.mkDefault false;
  gb.home.programs.ai.gemini-cli.enable = lib.mkDefault false;
}
