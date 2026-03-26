{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  hasDgop = builtins.hasAttr "dgop" unstablePkgs;
in
{
  config = lib.mkIf (mango.enable && mango.dms.enable) (
    lib.mkMerge [
      (lib.mkIf hasDgop {
        programs.dank-material-shell.dgop.package = lib.mkDefault unstablePkgs.dgop;
      })
      (lib.mkIf (!hasDgop) {
        programs.dank-material-shell.enableSystemMonitoring = lib.mkForce false;
      })
    ]
  );
}
