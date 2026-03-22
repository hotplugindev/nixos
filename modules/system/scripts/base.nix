{ ... }:
{
  # Shared command wrappers available on all hosts (update/sync/edit helpers).
  # Add new scripts here when they should be globally available system-wide.
  imports = [
    ./system-conf-update.nix
  ];
}
