{
  inputs,
  ...
}:
{
  imports = [
    inputs.mango.hmModules.mango
    ./options.nix
    ./program.nix
    ./packages.nix
  ];
}
