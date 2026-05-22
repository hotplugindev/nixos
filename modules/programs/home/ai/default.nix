{ lib, ... }:
{
  imports = [
    ./codex.nix
    ./claude-code.nix
    ./gemini-cli.nix
    ./llama-cpp.nix
  ];

  gb.home.programs.ai.llama-cpp.enable = lib.mkDefault true;
}
