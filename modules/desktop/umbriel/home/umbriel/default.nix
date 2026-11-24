{
  inputs,
  ...
}:
{
  imports = [
    inputs.umbriel.homeModules.default
    ./options.nix
    ./program.nix
    ./packages.nix
  ];
}
