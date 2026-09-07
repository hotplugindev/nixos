{ lib, ... }:
{
  imports = [
    ./dotnet.nix
    ./node.nix
    ./c.nix
    ./go.nix
    ./rust.nix
    ./zig.nix
    ./python.nix
    ./php.nix
    ./flutter.nix
    ./java.nix
    ./kotlin.nix
    ./ruby.nix
    ./haskell.nix
    ./elixir.nix
    ./lua.nix
    ./scala.nix
    ./clojure.nix
    ./perl.nix
    ./r.nix
  ];
}
