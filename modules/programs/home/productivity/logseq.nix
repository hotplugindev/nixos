{
  lib,
  config,
  pkgs,
  ...
}:

let
  logseq = config.gb.home.programs.productivity.logseq;

  logseqPkgs =
    import
      (fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/refs/pull/516682/head.tar.gz";
        sha256 = "sha256:03aixpbfw7anq2lyg7nvks4fshaanpdamg16281k8v9zblddpn9f";
      })
      {
        system = pkgs.stdenv.hostPlatform.system;
      };
in
{
  options = {
    gb.home.programs.productivity.logseq.enable = lib.mkEnableOption "Enable logseq note keeper";
  };

  config = lib.mkIf logseq.enable {
    home.packages = [
      logseqPkgs.logseq_2
    ];
  };
}
