{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  cfg = mango.mangowc;
  includeFiles = lib.escapeShellArgs cfg.dmsIncludes.files;
in
{
  config = lib.mkIf (mango.enable && mango.mangowc.enable && cfg.dmsIncludes.enable) {
    home.activation.mangoDmsIncludeBootstrap = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/.config/mango/dms"
      for include_file in ${includeFiles}; do
        if [ ! -e "$HOME/.config/mango/dms/$include_file" ]; then
          : > "$HOME/.config/mango/dms/$include_file"
        fi
      done
    '';
  };
}
