{ lib, ... }:
{
  imports = [
    ./codex.nix
    ./claude-code.nix
    ./gemini-cli.nix
    ./antigravity-cli.nix
    ./llama-cpp.nix
    ./qwen-code.nix
    ./aider-chat.nix
    ./opencode.nix
    ./opencode-desktop.nix
  ];
}
