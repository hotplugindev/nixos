{ lib, ... }:
{
  imports = [
    ./codex.nix
    ./claude-code.nix
    ./gemini-cli.nix
    ./llama-cpp.nix
  ];

  gb.home.programs.ai.llama-cpp.enable = lib.mkDefault true;
  gb.home.programs.ai.codex.enable = lib.mkDefault false;
  gb.home.programs.ai.claude-code.enable = lib.mkDefault false;
  gb.home.programs.ai.gemini-cli.enable = lib.mkDefault false;
}
