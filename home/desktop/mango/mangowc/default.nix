{
  inputs,
  ...
}:
{
  imports = [
    inputs.mango.hmModules.mango
    ./options.nix
    ./program.nix
    ./config-files.nix
    ./packages.nix
  ];
}
